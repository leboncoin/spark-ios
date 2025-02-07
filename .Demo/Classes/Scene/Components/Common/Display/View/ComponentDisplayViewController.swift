//
//  ComponentDisplayViewControllerRepresentable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - Representable

struct ComponentDisplayViewControllerRepresentable<
    Configuration: ComponentConfiguration,
    ComponentView: UIView,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ComponentViewMaker: ComponentUIViewMaker<ComponentView, Configuration>
>: UIViewControllerRepresentable {

    // MARK: - Type Alias

    typealias UIViewControllerType = ComponentDisplayViewController<ComponentView, Configuration, ConfigurationView, ComponentViewMaker>

    // MARK: - Properties

    var configurations: [Configuration] = [.init()]
    var style: ComponentDisplayStyle = .default
    var styles = ComponentDisplayStyle.allUIKitCases

    // MARK: - View

    func makeUIViewController(context: Context) -> UIViewControllerType {
        .init(configurations: self.configurations, style: self.style, styles: self.styles)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

// MARK: - View Controller

class ComponentDisplayViewController<
    ComponentView: UIView,
    Configuration: ComponentConfiguration,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ComponentViewMaker: ComponentUIViewMaker<ComponentView, Configuration>
>: UIViewController {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.topBarStackView,
            self.aloneSectionStackView,
            self.horizontalContentSectionStackView,
            self.verticalTableView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = .init(spacing: .medium)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var topBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.displayModeButton,
            self.addItemButton,
            self.updateItemButton,
            UIView(),
            self.refreshButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = .init(spacing: .medium)
        stackView.layer.cornerRadius = .init(radius: .medium)
        stackView.backgroundColor = .systemGroupedBackground
        stackView.layoutMargins = .init(all: .small)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private lazy var displayModeButton: UIButton = {
        let menu = UIMenu(title: "", children: self.styles.map { style in
            UIAction(title: style.name, image: UIImage(systemName: style.systemImage), handler: { _ in
                self.style = style
            })
        })

        return self.createTopBarButton(
            with: menu,
            systemName: "slider.horizontal.3"
        )
    }()

    private lazy var addItemButton: UIButton = {
        let button = self.createTopBarButton(
            systemName: "plus"
        )
        button.addAction(.init(handler: { _ in
            let newConfiguration = Configuration()
            self.configurations.append(newConfiguration)

            // Show a present configuration view
            if self.style.showConfiguration {
                self.selectedConfiguration = newConfiguration
                self.presentConfigurationView()
            }
        }), for: .touchUpInside)
        return button
    }()

    private lazy var updateItemButton: UIButton = {
        let button = self.createTopBarButton(
            systemName: "pencil"
        )
        button.addAction(.init(handler: { _ in
            guard let configuration = self.configurations.first else { return }

            // Show a present configuration view
            self.selectedConfiguration = configuration
            self.presentConfigurationView()
        }), for: .touchUpInside)
        return button
    }()

    private lazy var refreshButton: UIButton = {
        let button = self.createTopBarButton(
            systemName: "arrow.counterclockwise"
        )
        button.addAction(.init(handler: { _ in
            self.reloadCurrentSection()
        }), for: .touchUpInside)
        return button
    }()

    private lazy var aloneSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()

    private lazy var horizontalContentSectionStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.text = "Horizontal content"
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)

        let subTitleLabel = UILabel()
        subTitleLabel.text = "Max screen width"
        subTitleLabel.font = UIFont.italicSystemFont(ofSize: 12)

        let infoStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            subTitleLabel
        ])
        infoStackView.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [
            infoStackView,
            self.horizontalComponentsStackView
        ])
        stackView.backgroundColor = .secondarySystemBackground
        stackView.layer.cornerRadius = .init(radius: .medium)
        stackView.axis = .vertical
        stackView.spacing = .init(spacing: .medium)
        stackView.layoutMargins = .init(all: .medium)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.isHidden = true

        return stackView
    }()

    private var horizontalComponentsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.spacing = .init(spacing: .xSmall)
        return stackView
    }()

    private var verticalTableView: TableView = {
        let tableView = TableView()
        return tableView
    }()

    // MARK: - Properties

    private var style: ComponentDisplayStyle {
        didSet {
            self.reloadSectionVisibility()
        }
    }
    private let styles: [ComponentDisplayStyle]

    private var configurations: [Configuration] {
        didSet {
            self.reloadSectionContents()
            // TODO: check if add ?
            // TODO: check if remove ?
        }
    }
    private var selectedConfiguration: Configuration?

    private var presentedComponentImpl: ComponentImplementationUIView<ComponentView, Configuration>?

    private lazy var _selectedConfiguration: Binding<Configuration> = .init {
        guard let selectedConfiguration = self.selectedConfiguration else {
            fatalError("Selected Configuration not set")
        }
        return selectedConfiguration
    } set: { selectedConfiguration in
        self.selectedConfiguration = selectedConfiguration
        self.reloadComponent()
    }

    // MARK: - Initializer

    init(
        configurations: [Configuration],
        style: ComponentDisplayStyle,
        styles: [ComponentDisplayStyle]
    ) {
        self.configurations = configurations
        self.selectedConfiguration = configurations.first
        self.style = style
        self.styles = styles

        super.init(nibName: nil, bundle: nil)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Properties
        self.view.backgroundColor = .systemBackground

        // Subviews
        self.view.addSubview(self.contentStackView)

        // Reload all content visibility
        self.reloadSectionVisibility()
        self.reloadSectionContents()

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self.view,
            insets: .init(horizontalPadding: .medium)
        )
    }

    // MARK: - Create

    private func createComponentImplementationView(
        for configuration: Configuration,
        context: ComponentContextType
    ) -> ComponentImplementationUIView<ComponentView, Configuration> {
        let componentView = ComponentViewMaker.createComponentView(
            from: configuration
        )

        return .init(
            configuration: configuration,
            componentView: componentView,
            contextType: context,
            fullWidth: ComponentViewMaker.fullWidth || configuration.width.infinite
        )
    }

    private func createConfigurationView(
        for configuration: Configuration,
        afterUpdate: Bool = false
    ) -> ConfigurationView {
        let implementationView = self.createComponentImplementationView(for: configuration, context: .configuration)
        if !afterUpdate {
            self.presentedComponentImpl = implementationView
        }

        let representableView: ComponentImplementationUIViewRepresentable = .init(
            configuration: self._selectedConfiguration,
            componentImplementationView: implementationView
        )

        return ConfigurationView(
            configuration: self._selectedConfiguration,
            uiKitComponentImplementationView: representableView
        )
    }

    private func createTopBarButton(with menu: UIMenu? = nil, systemName: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: systemName), for: .normal)
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = .init(radius: .medium)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        return button
    }

    // MARK: - Reload

    private func reloadComponent() {
        guard let selectedConfiguration else {
            return
        }

        // ***
        // Present
        self.updatePresentRoot()
        if let presentedComponentImpl {
            ComponentViewMaker.updateComponentView(
                presentedComponentImpl.componentView,
                from: selectedConfiguration
            )
        }
        // ***

        // ***
        // Alone
        for (index, view) in self.aloneSectionStackView.arrangedSubviews.enumerated() {
            if let view = view as? ComponentImplementationUIView<ComponentView, Configuration>,
                view.configuration.id == selectedConfiguration.id {
                // Remove previous component view
                self.aloneSectionStackView.removeArrangedSubview(view)
                view.removeFromSuperview()

                // Add the updated component view
                let newComponentView = self.createComponentImplementationView(for: selectedConfiguration, context: .display)
                self.aloneSectionStackView.insertArrangedSubview(newComponentView, at: index)
            }
        }
        // ***
    }

    private func reloadCurrentSection() {
        switch self.style {
        case .alone:
            self.reloadAloneSection()
        case .horizontalList: // Not visibile in UIKit
            break
        case .horizontalContent:
            self.reloadHorizontalSection()
        case .verticalList:
            break // TODO:
        }
    }

    private func reloadSectionVisibility() {
        // Top bar buttons
        self.addItemButton.isHidden = !self.styles.hasAddButton(currentStyle: self.style)
        self.updateItemButton.isHidden = self.selectedConfiguration == nil || self.style != .alone
        self.displayModeButton.isHidden = self.styles.count == 1

        // Section visibility
        self.aloneSectionStackView.isHidden = self.style != .alone
        self.horizontalContentSectionStackView.isHidden = self.style != .horizontalContent
        self.verticalTableView.isHidden = self.style != .verticalList
    }

    private func reloadSectionContents() {
        self.reloadAloneSection()
        self.reloadHorizontalSection()
    }

    private func reloadAloneSection() {
        // Remove all in
        for view in self.aloneSectionStackView.arrangedSubviews{
            self.aloneSectionStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        // Add first component
        if let configuration = self.configurations.first {
            let view = self.createComponentImplementationView(for: configuration, context: .display)
            self.aloneSectionStackView.addArrangedSubview(view)
        }

        self.aloneSectionStackView.addArrangedSubview(UIView()) // Space
    }

    private func reloadHorizontalSection() {
        // Remove all in
        for view in self.horizontalComponentsStackView.arrangedSubviews{
            self.horizontalComponentsStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        // Add all components
        for configuration in configurations {
            let view = ComponentViewMaker.createComponentView(from: configuration)
            self.horizontalComponentsStackView.addArrangedSubview(view)
        }

        self.horizontalComponentsStackView.addArrangedSubview(UIView()) // Space
    }

    // MARK: - Present

    private func presentConfigurationView() {
        guard let selectedConfiguration else {
            return
        }

        let configurationView = self.createConfigurationView(for: selectedConfiguration)
        let hostingController = UIHostingController(rootView: configurationView)
        hostingController.overrideUserInterfaceStyle = .dark // TODO: remove

        self.present(hostingController, animated: true)
    }

    private func updatePresentRoot() {
        guard let hostingController = self.presentedViewController as? UIHostingController<ConfigurationView>,
        let selectedConfiguration else {
            return
        }

        let configurationView = self.createConfigurationView(for: selectedConfiguration, afterUpdate: true)
        hostingController.rootView = configurationView
    }
}

// TODO: move to another file ?

private final class TableView: UIView {

    // MARK: - Component

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Properties

    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)

        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Properties
        self.backgroundColor = .clear

        // Subviews
        self.addSubview(self.tableView)

        // Registration
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.stickEdges(from: self.tableView, to: self)
    }
}

extension TableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row]
        return cell
    }
}

extension TableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Update") { (action, view, success) in
            // TODO:
            success(true)
        }
        action.backgroundColor = .systemBlue

        return UISwipeActionsConfiguration(actions: [action])
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Remove") { (action, view, success) in
            // TODO:
            success(true)
        }

        return UISwipeActionsConfiguration(actions: [action])
    }
}
