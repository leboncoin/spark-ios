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
    ComponentViewMaker: ComponentUIViewMaker<ComponentView, Configuration>
>: UIViewControllerRepresentable {
    typealias UIViewControllerType = ComponentDisplayViewController<ComponentView, Configuration, ComponentViewMaker>

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
            self?.presentSwiftUIView()
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

    var configurationTagView: ComponentImplementationUIView<ComponentView, Configuration>? // TODO: check deinit

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

    private func createComponentImplementation(for context: ComponentContextType) -> ComponentImplementationUIView<ComponentView, Configuration> {
        let componentView = ComponentViewMaker.createComponentView(from: self.configuration)
        return .init(
            configuration: self.configuration,
            componentView: componentView,
            contextType: context,
            fullWidth: ComponentViewMaker.fullWidth
        )
    }

    // MARK: - Reload

    private func reloadComponent() {
        ComponentViewMaker.updateComponentView(
            self.tagView.componentView,
            from: self.configuration
        )

        if let configurationTagView {
            ComponentViewMaker.updateComponentView(
                configurationTagView.componentView,
                from: self.configuration
            )
        }
    }

    // MARK: - Actions

    func presentSwiftUIView() {
        let component = self.createComponentImplementation(for: .configuration)

        let componentRepresentable = ComponentImplementationUIViewRepresentable(
            configuration: self._configuration,
            component: component
        )

//        let configurationView = ComponentConfigurationUIView(
//            configuration: self._configuration,
//            implementationViewRepresentable: tagViewRepresentable
//        )
        let configurationView = ComponentViewMaker.createConfigurationView(
            from: self._configuration,
            componentImplementationRepresentable: componentRepresentable
        )


        let hostingController = UIHostingController(rootView: configurationView)
        self.configurationTagView = component

        self.present(hostingController, animated: true)
    }
}

