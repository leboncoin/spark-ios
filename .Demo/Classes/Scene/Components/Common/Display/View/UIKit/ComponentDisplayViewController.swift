//
//  ComponentDisplayViewControllerRepresentable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Combine

// TODO: UIKit: iOS 17 - Modal configuration bug

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
>: UIViewController, ComponentDisplayTableViewDelegate, ComponentDisplayConfigurationControllerDelegate {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
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
        let tableView = ComponentDisplayTableView<Configuration, ComponentView, ConfigurationView, ViewMaker>(
            viewMaker: self.viewMaker
        )
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Properties

    private var viewMaker = ViewMaker()

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

    var componentTapControlSubcription: AnyCancellable?
    var componentToggleAction: UIAction = .init { _ in }

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

        self.viewMaker.viewController = self

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.reloadNavigationItems()
    }

    // MARK: - Create

    private func createConfigurationView(
        for configuration: Configuration,
        afterUpdate: Bool = false
    ) -> ConfigurationView {
        let implementationView = self.viewMaker.createComponentImplementationView(
            for: configuration,
            context: .configuration,
            displayStyle: self.style
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
            self.viewMaker.updateComponentView(
                presentedComponentImpl.componentView,
                for: selectedConfiguration
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
                let newComponentView = self.viewMaker.createComponentImplementationView(
                    for: selectedConfiguration,
                    context: .display,
                    displayStyle: self.style
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

    private func reloadNavigationItems() {
        var rightBarButtonItems = [UIBarButtonItem]()
        if self.styles.hasAddButton(currentStyle: self.style) {
            rightBarButtonItems.append(.init(
                image: .init(systemName: "plus"),
                style: .plain,
                target: self,
                action: #selector(addComponentAction)
            ))
        }
        if self.selectedConfiguration != nil && self.style == .alone {
            rightBarButtonItems.append(.init(
                image: .init(systemName: "pencil"),
                style: .plain,
                target: self,
                action: #selector(updateItemAction)
            ))
        }
        if self.styles.count > 1 {
            let menu = UIMenu(title: "uhoh", children: self.styles.map { style in
                UIAction(title: style.name, image: UIImage(systemName: style.systemImage), handler: { _ in
                    self.style = style
                })
            })

            rightBarButtonItems.append(.init(
                image: UIImage(systemName: self.style.systemImage),
                menu: menu)
            )
        }

        self.navigationController?.topViewController?.navigationItem.rightBarButtonItems = rightBarButtonItems
    }

    private func reloadSectionVisibility() {
        // Navigation buttons
        self.reloadNavigationItems()

        // Section visibility
        self.aloneSectionStackView.isHidden = self.style != .alone
        self.horizontalContentSectionStackView.isHidden = self.style != .horizontalContent
        self.verticalTableView.isHidden = self.style != .verticalList
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
            let view = self.viewMaker.createComponentImplementationView(
                for: configuration,
                context: .display,
                displayStyle: self.style
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
            let view = self.viewMaker.createComponentView(for: configuration)
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

    @objc func displayModeAction() {
//        let menu = UIMenu(title: "", children: self.styles.map { style in
//            UIAction(title: style.name, image: UIImage(systemName: style.systemImage), handler: { _ in
//                self.style = style
//            })
//        })
//
//        return self.createTopBarButton(
//            with: menu
//        )
    }

    @objc func addComponentAction() {
        let newConfiguration = Configuration()
        self.configurations.append(newConfiguration)

        // Show a present configuration view
        if self.style.showConfiguration {
            self.selectedConfiguration = newConfiguration
            self.presentConfigurationView()
        }
    }

    @objc func updateItemAction() {
        guard let configuration = self.configurations.first else { return }

        // Show a present configuration view
        self.selectedConfiguration = configuration
        self.presentConfigurationView()
    }

    @objc func componentTouchUpInsideAction() {
        self.showTapAlert(for: .target)
    }

    // MARK: - Present

    private func presentConfigurationView() {
        guard let selectedConfiguration else {
            return
        }

        let configurationView = self.createConfigurationView(for: selectedConfiguration)
        .navigationViewStyle(StackNavigationViewStyle())

        let hostingController = ComponentDisplayConfigurationController(rootView: configurationView)
        hostingController.delegate = self

        self.present(hostingController, animated: true)
    }

    private func updatePresentRoot() {
        guard let hostingController = self.presentedViewController as? ComponentDisplayConfigurationController<ConfigurationView>,
        let selectedConfiguration else {
            return
        }

        let configurationView = self.createConfigurationView(for: selectedConfiguration, afterUpdate: true)
        hostingController.rootView = configurationView
    }

    // MARK: - Alert

    func showTapAlert(for controlType: ComponentControlType, name: String? = nil) {
        let alertController = UIAlertController(
            title: "Tap from " + (name ?? controlType.name),
            message: nil,
            preferredStyle: .alert
        )
        alertController.addAction(.init(title: "Ok", style: .default))

        let parentViewController = self.presentedViewController ?? self
        parentViewController.present(alertController, animated: true)
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

    // MARK: - ComponentDisplayConfigurationControllerDelegate

    func presentWillDisappear() {
        self.reloadCurrentSection()
    }
}
