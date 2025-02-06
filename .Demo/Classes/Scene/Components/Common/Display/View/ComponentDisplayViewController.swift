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

    // MARK: - View

    func makeUIViewController(context: Context) -> UIViewControllerType {
        .init()
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
            self.button,
            self.componentContentStackView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .blue
        button.setTitle("Title", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.presentConfigurationView()
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var componentContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.tagView,
            UIView()
        ])
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var tagView: ComponentImplementationUIView = self.createComponentImplementation(for: .display)

    // MARK: - Properties

    var configuration: Configuration = .init()

    var presentedComponentImpl: ComponentImplementationUIView<ComponentView, Configuration>?
    var presentedHostingController: UIHostingController<ConfigurationView>?

    lazy var _configuration: Binding<Configuration> = .init {
        self.configuration
    } set: { configuration in
        self.configuration = configuration
        self.reloadComponent()
    }

    // MARK: - Initializer

    init() {
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

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        // ScrollView
        NSLayoutConstraint.activate([
            self.contentStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.contentStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 14),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14)
        ])
    }

    // MARK: - Create

    private func createComponentImplementation(
        for context: ComponentContextType
    ) -> ComponentImplementationUIView<ComponentView, Configuration> {
        let componentView = ComponentViewMaker.createComponentView(
            from: self.configuration
        )

        return .init(
            configuration: configuration,
            componentView: componentView,
            contextType: context,
            fullWidth: self.configuration.width.infinite
        )
    }

    private func createConfigurationView() -> ConfigurationView {
        guard let presentedComponentImpl else {
            fatalError()
        }

        let representableView: ComponentImplementationUIViewRepresentable = .init(
            configuration: self._configuration,
            componentImplementationView: presentedComponentImpl
        )

        return ConfigurationView(
            configuration: self._configuration,
            uiKitComponentImplementationView: representableView
        )
    }

    // MARK: - Reload

    private func reloadComponent() {
        ComponentViewMaker.updateComponentView(
            self.tagView.componentView,
            from: self.configuration
        )

        if let presentedComponentImpl {
            ComponentViewMaker.updateComponentView(
                presentedComponentImpl.componentView,
                from: self.configuration
            )
        }

        self.reloadPresent()
    }

    // MARK: - Present

    private func presentConfigurationView() {
        let implementationView = self.createComponentImplementation(for: .configuration)
        self.presentedComponentImpl = implementationView

        let configurationView = self.createConfigurationView()
        let hostingController = UIHostingController(rootView: configurationView)
        self.presentedHostingController = hostingController

        self.present(hostingController, animated: true)
    }

    private func reloadPresent() {
        guard let presentedHostingController else { return }

        let configurationView = self.createConfigurationView()
        presentedHostingController.rootView = configurationView
    }

    // CODE QUI FONCTIONNE
//    private func presentConfigurationView() {
//        let implementationView = self.createComponentImplementation(for: .configuration)
//
//        let representableView: ComponentImplementationUIViewRepresentable = .init(
//            configuration: self._configuration,
//            componentImplementationView: implementationView
//        )
//
//        let configurationView = ConfigurationView(
//            configuration: self._configuration,
//            uiKitComponentImplementationView: representableView
//        )
//
//        let hostingController = UIHostingController(rootView: configurationView)
//
//        self.present(hostingController, animated: true)
//
//        self.presentedHostingController = hostingController
//
//
//        self.presentedComponentImpl = implementationView
//    }
//
//    private func reloadPresent() {
//        let implementationView = self.createComponentImplementation(for: .configuration)
//
//        let representableView: ComponentImplementationUIViewRepresentable = .init(
//            configuration: self._configuration,
//            componentImplementationView: implementationView
//        )
//
//        let configurationView = ConfigurationView(
//            configuration: self._configuration,
//            uiKitComponentImplementationView: representableView
//        )
//
//        self.presentedHostingController?.rootView = configurationView
//    }
}
