//
//  FormFieldComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias FormFieldComponentUIViewController = ComponentDisplayViewControllerRepresentable<FormFieldConfiguration, FormFieldDynamicUIView, FormFieldConfigurationView, FormFieldComponentUIViewMaker, FormFieldExtraTools>

extension FormFieldComponentUIViewController {

    init() {
        let configurations: [FormFieldConfiguration] = FormFieldComponentType.allCases.map {
            .init(componentType: $0)
        }
        self.init(configurations: configurations, style: .alone, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class FormFieldComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = FormFieldConfiguration
    typealias ComponentView = FormFieldDynamicUIView
    typealias ConfigurationView = FormFieldConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, FormFieldComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = FormFieldExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        .init(configuration)
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.updateView(for: configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - SubView

final class FormFieldDynamicUIView: UIView {

    // MARK: - Type Alias

    typealias Configuration = FormFieldComponentUIViewMaker.Configuration

    // MARK: - Properties

    private var formFieldView: UIView?
    private var text: String? {
        didSet {
            switch self.formFieldView {
            case let view as FormFieldUIView<TextEditorComponentUIViewMaker.ComponentView>:
                view.demoSetCounterIfPossible(on: self.text, for: self.configuration)

            case let view as FormFieldUIView<TextFieldComponentUIViewMaker.ComponentView>:
                view.demoSetCounterIfPossible(on: self.text, for: self.configuration)

            default: break
            }
        }
    }
    private var configuration: Configuration

    // MARK: - Initialization

    init(_ configuration: Configuration) {
        self.configuration = configuration

        super.init(frame: .zero)

        self.createFormField()
        self.setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Create

    private func createFormField() {
        switch self.configuration.componentType {
        case .checkbox:
            let maker = CheckboxGroupComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.checkboxGroupConfiguration)
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
            formFieldView.clearButton.addAction(.init(handler: { _ in
                for checkbox in view.checkboxes {
                    checkbox.selectionState = .unselected
                }
            }), for: .touchUpInside)
            self.formFieldView = formFieldView

        case .radioButton:
            let maker = RadioGroupComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.radioButtonConfiguration)
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
            formFieldView.clearButton.addAction(.init(handler: { _ in
                view.selectedID = nil
            }), for: .touchUpInside)
            self.formFieldView = formFieldView

        case .stepper:
            let maker = StepperComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.stepperConfiguration)
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
            formFieldView.clearButton.addAction(.init(handler: { _ in
                view.value = Double(self.configuration.stepperConfiguration.lowerBoundString) ?? 0
            }), for: .touchUpInside)
            self.formFieldView = formFieldView

        case .textEditor:
            let maker = TextEditorComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.textEditorConfiguration)
            view.delegate = self
            self.text = view.text
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
            formFieldView.clearButton.addAction(.init(handler: { _ in
                view.text = ""
            }), for: .touchUpInside)
            self.formFieldView = formFieldView

        case .textField:
            let maker = TextFieldComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.textFieldConfiguration)

            view.addAction(.init(handler: { [weak self] _ in
                self?.text = view.text
            }), for: .editingChanged)
            self.text = view.text
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration, text: view.text)
            formFieldView.clearButton.addAction(.init(handler: { _ in
                view.text = ""
            }), for: .touchUpInside)
            self.formFieldView = formFieldView
        }
    }

    // MARK: - Setup

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.rebuildFormFieldView()
    }

    private func rebuildFormFieldView() {
        guard let formFieldView = self.formFieldView else {
            fatalError("Subview must be setted")
        }

        self.addSubview(formFieldView)
        NSLayoutConstraint.stickEdges(from: formFieldView, to: self)
    }

    // MARK: - Update

    func updateView(for configuration: Configuration) {
        switch self.formFieldView {
        case let view as FormFieldUIView<CheckboxGroupComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<RadioGroupComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<StepperComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<TextEditorComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<TextFieldComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<UILabel>:
            view.updateProperties(self.configuration, text: self.text)
            view.isAccessibilityElement = true

        default: break
        }
    }
}

extension FormFieldDynamicUIView: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        self.text = textView.text
    }
}

// MARK: - Extension

private extension FormFieldUIView {

    convenience init(
        _ configuration: FormFieldConfiguration,
        component: Component
    ) {
        self.init(
            theme: configuration.theme.value,
            component: component,
            feedbackState: configuration.feedbackState,
            title: configuration.title.nilIfEmpty,
            helper: configuration.helper.nilIfEmpty,
            isRequired: configuration.isRequired
        )
    }

    func updateProperties(_ configuration: FormFieldConfiguration, text: String?) {
        self.theme = configuration.theme.value
        self.feedbackState = configuration.feedbackState
        self.isRequired = configuration.isRequired
        self.demoText(configuration)
        self.demoUpdateCommonProperties(configuration, text: text)
    }

    func demoUpdateCommonProperties(_ configuration: FormFieldConfiguration, text: String? = nil) {
        self.titleLabel.accessibilityLabel = configuration.titleAccessibilityLabel.nilIfEmpty
        self.clearButton.accessibilityLabel = configuration.clearButtonAccessibilityLabel.nilIfEmpty
        self.helperLabel.accessibilityLabel = configuration.helperAccessibilityLabel.nilIfEmpty
        self.helperLabel.accessibilityLabel = configuration.secondaryHelperAccessibilityLabel.nilIfEmpty
        self.secondaryHelperLabel.accessibilityLabel = configuration.secondaryHelperAccessibilityValue.nilIfEmpty

        self.clearButtonImage = .init(icon: configuration.clearButtonIcon)
        self.helperImage = .init(icon: configuration.helperIcon)
        self.demoSetCounterIfPossible(on: text, for: configuration)
    }

    func demoText(_ configuration: FormFieldConfiguration) {
        self.title = configuration.title.nilIfEmpty
        self.helper = configuration.helper.nilIfEmpty
    }

    func demoSetCounterIfPossible(on text: String?, for configuration: FormFieldConfiguration) {
        let counterChanged: Bool

        switch self {
        case let view as FormFieldUIView<TextFieldUIView>:
            view.setCounter(on: text, limit: configuration.textInputCounterLimit)
            counterChanged = true
        case let view as FormFieldUIView<TextEditorUIView>:
            view.setCounter(on: text, limit: configuration.textInputCounterLimit)
            counterChanged = true
        default:
            counterChanged = false
        }

        if counterChanged, configuration.helperAccessibilityLabel.isEmpty  {
            self.secondaryHelperLabel.accessibilityLabel = "\(text?.count ?? 0) caractères sur \(configuration.textInputCounterLimit)"
        }
    }
}
