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

typealias FormFieldComponentUIViewController = ComponentDisplayViewControllerRepresentable<FormFieldConfiguration, FormFieldDynamicUIView, FormFieldConfigurationView, FormFieldComponentUIViewMaker>

extension FormFieldComponentUIViewController {

    init() {
        let configurations: [FormFieldConfiguration] = FormFieldComponentType.allCases.map {
            .init(componentType: $0)
        }
        self.init(configurations: configurations, style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class FormFieldComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = FormFieldConfiguration
    typealias ComponentView = FormFieldDynamicUIView
    typealias ConfigurationView = FormFieldConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, FormFieldComponentUIViewMaker>

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
            self.formFieldView = formFieldView

        case .radioButton:
            let maker = RadioButtonGroupComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.radioButtonConfiguration)
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
            self.formFieldView = formFieldView

        case .stepper:
            let maker = StepperComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.stepperConfiguration)
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
            self.formFieldView = formFieldView

        case .textEditor:
            let maker = TextEditorComponentUIViewMaker()
            let view = maker.createComponentView(for: self.configuration.textEditorConfiguration)
            view.delegate = self
            self.text = view.text
            let formFieldView = FormFieldUIView(self.configuration, component: view)
            formFieldView.demoUpdateCommonProperties(self.configuration)
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

        case let view as FormFieldUIView<RadioButtonGroupComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<StepperComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<TextEditorComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

        case let view as FormFieldUIView<TextFieldComponentUIViewMaker.ComponentView>:
            view.updateProperties(self.configuration, text: self.text)

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
        if configuration.isAttributedString {
            self.init(
                theme: configuration.theme.value,
                component: component,
                feedbackState: configuration.feedbackState,
                attributedTitle: configuration.title.demoNSAttributedString,
                attributedHelper: configuration.helper.demoNSAttributedString,
                isTitleRequired: configuration.isTitleRequired
            )
        } else {
            self.init(
                theme: configuration.theme.value,
                component: component,
                feedbackState: configuration.feedbackState,
                title: configuration.title,
                helper: configuration.helper,
                isTitleRequired: configuration.isTitleRequired
            )
        }
    }

    func updateProperties(_ configuration: FormFieldConfiguration, text: String?) {
        self.theme = configuration.theme.value
        self.feedbackState = configuration.feedbackState
        self.isTitleRequired = configuration.isTitleRequired
        self.demoText(configuration)
        self.demoUpdateCommonProperties(configuration, text: text)
    }

    func demoUpdateCommonProperties(_ configuration: FormFieldConfiguration, text: String? = nil) {
        self.titleLabel.accessibilityLabel = configuration.titleAccessibilityLabel
        self.helperLabel.accessibilityLabel = configuration.helperAccessibilityLabel
        self.helperLabel.accessibilityLabel = configuration.secondaryHelperAccessibilityLabel
        self.secondaryHelperLabel.accessibilityLabel = configuration.secondaryHelperAccessibilityValue
        self.demoSetCounterIfPossible(on: text, for: configuration)
    }

    func demoText(_ configuration: FormFieldConfiguration) {
        if configuration.isAttributedString {
            self.attributedTitle = configuration.title.demoNSAttributedString
            self.attributedHelper = configuration.helper.demoNSAttributedString
        } else {
            self.title = configuration.title
            self.helperString = configuration.helper
        }
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
