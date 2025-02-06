//
//  ComponentDisplayViewController.swift
//  SparkDemo
//
//  Created by robin.lemaire on 03/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

// TODO: remove

/*
import SwiftUI

// MARK: - Representable

struct ComponentDisplayViewControllerRepresentable: UIViewControllerRepresentable {

    // MARK: - View

    func makeUIViewController(context: Context) -> ComponentDisplayViewController {
        .init()
    }

    func updateUIViewController(_ uiViewController: ComponentDisplayViewController, context: Context) {
    }
}

// MARK: - View Controller

class ComponentDisplayViewController: UIViewController {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.button,
            self.tagContentStackView,
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

    private lazy var tagContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.tagView,
            UIView()
        ])
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var tagView: TagImplementationUIView = self.createComponent()

    // MARK: - Properties

    var configuration: TagConfiguration = .init()

    var configurationTagView: TagImplementationUIView?

    lazy var _configuration: Binding<TagConfiguration> = .init {
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

    private func createComponent() -> TagImplementationUIView {
        let tagView = TagImplementationUIView(
            configuration: self.configuration,
            contextType: .display,
            fullWidth: true
        )
        tagView.translatesAutoresizingMaskIntoConstraints = false
        return tagView
    }

    // MARK: - Reload

    private func reloadComponent() {
        self.tagView.componentView.intent = self.configuration.intent

        self.configurationTagView?.componentView.intent = self.configuration.intent
    }

    // MARK: - Actions

    func presentSwiftUIView() {
        let component = self.createComponent()

        let tagViewRepresentable = TagImplementationUIViewRepresentable(
            configuration: self._configuration,
            component: component
        )

        let configurationView = TagConfiguration2View(
            configuration: self._configuration,
            implementationView: tagViewRepresentable
        )
        let hostingController = UIHostingController(rootView: configurationView)
        self.configurationTagView = component

        self.present(hostingController, animated: true)
    }
}




























struct TagConfiguration2View: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>
    private var implementationView: TagImplementationUIViewRepresentable! // TODO: remove force unwrap

    // MARK: - Initialization

    init(configuration: Binding<TagConfiguration>) {
        self.configuration = configuration
    }

    init(configuration: Binding<TagConfiguration>, implementationView: TagImplementationUIViewRepresentable) { // TODO: replace by reprensetableView
        self.configuration = configuration
        self.implementationView = implementationView
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentView: self.implementationView,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: TagIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "variant",
                    values: TagVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                OptionalEnumConfigurationView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                TextFieldConfigurationView(
                    name: "text",
                    text: self.configuration.text
                )

                ToggleConfigurationView(
                    name: "is attributed text",
                    isOn: self.configuration.isAttributedText
                )
            }
        )
    }
}


















struct TagImplementationUIViewRepresentable: UIViewRepresentable, ComponentImplementationViewable {

    var configuration: Binding<TagConfiguration>
    var component: TagImplementationUIView? // TODO: remove force unwrap and optional

    init(configuration: Binding<TagConfiguration>) {
        self.configuration = configuration
    }

    init(configuration: Binding<TagConfiguration>, component: TagImplementationUIView) {
        self.configuration = configuration
        self.component = component
    }

    func makeUIView(context: Context) -> TagImplementationUIView {
        self.component!.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.component!.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return self.component!
    }

    func updateUIView(_ uiView: TagImplementationUIView, context: Context) {
        uiView.invalidateIntrinsicContentSize()
        print("LOGROB upadte view \(configuration.intent)")
    }
}

final class TagImplementationUIView: UIView {

    // MARK: - Components

    lazy var componentView: TagUIView = {
        let view = TagUIView(
            theme: DemoThemes.shared.mainTheme.value,
            intent: self.configuration.intent,
            variant: self.configuration.variant,
//            iconImage: .init(icon: self.configuration.icon),
//            text: "My Tag ^pao o ek  gzioj  vapi ou rgize rgnqsdpuihzauerh gpu r"
            text: self.configuration.text
        )

//        let view = TextFieldUIView(
//            theme: DemoThemes.shared.mainTheme.value,
//            intent: .neutral
//        )
//        view.placeholder = "My placeholder"

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Properties

    var configuration: TagConfiguration
    let contextType: ComponentContextType
    let fullWidth: Bool

    private var widthLayoutConstraint: NSLayoutConstraint?
    private var trailingLayoutConstraint: NSLayoutConstraint?

    // MARK: - Initializer

    init(configuration: TagConfiguration, contextType: ComponentContextType, fullWidth: Bool = false) {
        self.configuration = configuration
        self.contextType = contextType
        self.fullWidth = fullWidth
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
        self.backgroundColor = .blue

        // Subviews
        self.addSubview(self.componentView)

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.componentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.componentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.componentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        // Constraints
        self.widthLayoutConstraint = self.componentView.widthAnchor.constraint(equalToConstant: 1)
        self.widthLayoutConstraint?.isActive = false

        self.trailingLayoutConstraint = self.componentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.trailingLayoutConstraint?.isActive = false
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        guard self.frame.width > 0 else {
            return
        }

        if self.fullWidth || self.componentView.frame.size.width >= self.frame.width {
            self.widthLayoutConstraint?.constant = self.frame.width
            self.widthLayoutConstraint?.isActive = true
            self.trailingLayoutConstraint?.isActive = false

        } else {
            switch self.contextType {
            case .display:
                self.widthLayoutConstraint?.isActive = false
                self.trailingLayoutConstraint?.isActive = false

            case .configuration:
                self.widthLayoutConstraint?.isActive = false
                self.trailingLayoutConstraint?.isActive = true
            }
        }
    }

    // MARK: - Intrinsic Content Size

    override var intrinsicContentSize: CGSize {
        return .init(width: -1, height: self.componentView.frame.height)
    }
}
*/
