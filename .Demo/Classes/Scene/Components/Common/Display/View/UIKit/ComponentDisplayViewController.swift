//
//  ComponentDisplayViewControllerRepresentable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI
import Combine

// MARK: - Representable

struct ComponentDisplayViewControllerRepresentable<
    Configuration: ComponentConfiguration,
    ComponentView: UIView,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ViewMaker: ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView>
>: UIViewControllerRepresentable {

    // MARK: - Type Alias

    typealias UIViewControllerType = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ViewMaker>

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
    Configuration: ComponentConfiguration,
    ComponentView: UIView,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ViewMaker: ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView>
>: UIViewController, ComponentDisplayTableViewDelegate {

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
        stackView.backgroundColor = .systemBackground
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
            with: menu
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
        stackView.backgroundColor = .systemBackground
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

    private lazy var verticalTableView: ComponentDisplayTableView = {
        let tableView = ComponentDisplayTableView<Configuration, ComponentView, ConfigurationView, ViewMaker>()
        tableView.delegate = self
        tableView.viewController = self
        return tableView
    }()

    // MARK: - Properties

    private var style: ComponentDisplayStyle {
        didSet {
            self.reloadSectionVisibility()
            self.reloadCurrentSection()
        }
    }
    private let styles: [ComponentDisplayStyle]

    private var configurations: [Configuration] {
        didSet {
            self.reloadSectionContents()
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

    private(set) lazy var componentAction: UIAction = .init { _ in
        self.showTapAlert(for: .action)
    }

    var componentControlSubcription: AnyCancellable?

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
        self.view.backgroundColor = .systemGroupedBackground

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

    private func createConfigurationView(
        for configuration: Configuration,
        afterUpdate: Bool = false
    ) -> ConfigurationView {
        let implementationView = ViewMaker.createComponentImplementationView(
            for: configuration,
            context: .configuration,
            viewController: self
        )

        if !afterUpdate {
            self.presentedComponentImpl = implementationView
        }

        let representableView: ComponentImplementationUIViewRepresentable = .init(
            configuration: self._selectedConfiguration,
            componentImplementationView: implementationView
        )

        return ConfigurationView(
            configuration: self._selectedConfiguration,
            componentImplementationViewRepresentable: representableView
        )
    }

    private func createTopBarButton(with menu: UIMenu? = nil, systemName: String? = nil) -> UIButton {
        let button = UIButton(type: .custom)
        if let systemName {
            button.setImage(.init(systemName: systemName), for: .normal)
        }
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = .init(radius: .medium)
        button.tintColor = .systemBackground
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
            ViewMaker.updateComponentView(
                presentedComponentImpl.componentView,
                for: selectedConfiguration,
                viewController: self
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
                let newComponentView = ViewMaker.createComponentImplementationView(
                    for: selectedConfiguration,
                    context: .display,
                    viewController: self
                )
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
            self.reloadVerticalSection()
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

        // Button icon
        self.displayModeButton.setImage(UIImage(systemName: self.style.systemImage), for: .normal)
    }

    private func reloadSectionContents() {
        self.reloadAloneSection()
        self.reloadHorizontalSection()
        self.reloadVerticalSection()
    }

    private func reloadAloneSection() {
        guard self.styles.contains(where: { $0 == .alone }) else {
            return
        }

        // Remove all in stack view
        self.aloneSectionStackView.removeAllArrangedSubviews()

        // Add first component
        if let configuration = self.configurations.first {
            let view = ViewMaker.createComponentImplementationView(
                for: configuration,
                context: .display,
                viewController: self
            )
            self.aloneSectionStackView.addArrangedSubview(view)
        }

        self.aloneSectionStackView.addArrangedSubview(UIView()) // Space
    }

    private func reloadHorizontalSection() {
        guard self.styles.contains(where: { $0 == .horizontalContent }) else {
            return
        }

        // Remove all in stack view
        self.horizontalComponentsStackView.removeAllArrangedSubviews()

        // Add all components
        for configuration in configurations {
            let view = ViewMaker.createComponentView(for: configuration, viewController: self)
            self.horizontalComponentsStackView.addArrangedSubview(view)
        }

        self.horizontalComponentsStackView.addArrangedSubview(UIView()) // Space
    }

    private func reloadVerticalSection() {
        guard self.styles.contains(where: { $0 == .verticalList }) else {
            return
        }

        self.verticalTableView.configurations = self.configurations
    }

    // MARK: - Actions

    @objc func componentTouchUpInsideTarget() {
        self.showTapAlert(for: .target)
    }

    // MARK: - Present

    private func presentConfigurationView() {
        guard let selectedConfiguration else {
            return
        }

        let configurationView = self.createConfigurationView(for: selectedConfiguration)
        let hostingController = UIHostingController(rootView: configurationView)

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

    // MARK: - Alert

    func showTapAlert(for controlType: ComponentControlType) {
        let alertController = UIAlertController(
            title: "Tap from " + controlType.name,
            message: nil,
            preferredStyle: .alert
        )
        alertController.addAction(.init(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }

    // MARK: - TableViewDelegate

    func updateConfiguration(id: String) {
        guard let configuration = self.configurations.first(where: { $0.id == id }) else {
            return
        }

        self.selectedConfiguration = configuration
        self.presentConfigurationView()
    }

    func removeConfiguration(id: String) {
        self.configurations.removeAll(where: { $0.id == id })
    }
}
