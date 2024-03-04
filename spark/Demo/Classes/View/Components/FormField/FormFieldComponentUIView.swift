//
//  FormFieldComponentUIView.swift
//  Spark
//
//  Created by alican.aycil on 30.01.24.
//  Copyright (c) 2024 Adevinta. All rights reserved.
//

import Combine
import SparkCore
import Spark
import UIKit

final class FormFieldComponentUIView: ComponentUIView {

    // MARK: - Components
    private let componentView: FormFieldUIView

    // MARK: - Properties

    private let viewModel: FormFieldComponentUIViewModel
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initializer
    init(viewModel: FormFieldComponentUIViewModel) {
        self.viewModel = viewModel
        self.componentView = Self.makeFormField(viewModel)

        super.init(
            viewModel: viewModel,
            componentView: self.componentView
        )

        // Setup
        self.setupSubscriptions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subscribe
    private func setupSubscriptions() {
        self.viewModel.$theme.subscribe(in: &self.cancellables) { [weak self] theme in
            guard let self = self else { return }
            let themes = self.viewModel.themes
            let themeTitle: String? = theme is SparkTheme ? themes.first?.title : themes.last?.title

            self.viewModel.themeConfigurationItemViewModel.buttonTitle = themeTitle
            self.componentView.theme = theme
        }

        self.viewModel.$intent.subscribe(in: &self.cancellables) { [weak self] intent in
            guard let self = self else { return }
            self.viewModel.intentConfigurationItemViewModel.buttonTitle = intent.name
            self.componentView.intent = intent
        }

        self.viewModel.$titleStyle.subscribe(in: &self.cancellables) { [weak self] textStyle in
            guard let self = self else { return }
            self.viewModel.titleStyleConfigurationItemViewModel.buttonTitle = textStyle.name
            switch textStyle {
            case .text:
                self.componentView.title = self.viewModel.text
            case .asterixText:
                self.componentView.attributedTitle = self.viewModel.textWithAsterix
            case .opacityText:
                self.componentView.attributedTitle = self.viewModel.textWithOpacity
            case .multilineText:
                self.componentView.title = self.viewModel.multilineText
            case .attributeText:
                self.componentView.attributedTitle = self.viewModel.attributeText
            case .none:
                self.componentView.title = nil
            }
        }

        self.viewModel.$descriptionStyle.subscribe(in: &self.cancellables) { [weak self] textStyle in
            guard let self = self else { return }
            self.viewModel.descriptionStyleConfigurationItemViewModel.buttonTitle = textStyle.name
            switch textStyle {
            case .text:
                self.componentView.descriptionString = self.viewModel.descriptionText
            case .asterixText:
                self.componentView.attributedDescription = self.viewModel.textWithAsterix
            case .opacityText:
                self.componentView.attributedDescription = self.viewModel.textWithOpacity
            case .multilineText:
                self.componentView.descriptionString = self.viewModel.multilineText
            case .attributeText:
                self.componentView.attributedDescription = self.viewModel.attributeText
            case .none:
                self.componentView.descriptionString = nil
            }
        }

        self.viewModel.$componentStyle.subscribe(in: &self.cancellables) { [weak self] componentStyle in
            guard let self = self else { return }
            self.viewModel.componentStyleConfigurationItemViewModel.buttonTitle = componentStyle.name

            let component: UIControl!

            switch componentStyle {
            case .basic:
                component = Self.makeBasicView()
            case .singleCheckbox:
                component = Self.makeSingleCheckbox()
            case .verticalCheckbox:
                component = Self.makeVerticalCheckbox()
            case .horizontalCheckbox:
                component = Self.makeHorizontalCheckbox()
            case .horizontalScrollableCheckbox:
                component = Self.makeHorizontalScrollableCheckbox()
            case .singleRadioButton:
                component = Self.makeSingleRadioButton()
            case .verticalRadioButton:
                component = Self.makeVerticalRadioButton()
            case .horizontalRadioButton:
                component = Self.makeHorizontalRadioButton()
            case .textField:
                component = Self.makeTextField()
            case .addOnTextField:
                component = Self.makeAddOnTextField()
            case .ratingInput:
                component = Self.makeRatingInput()
            }

            self.componentView.component = component
        }

        self.viewModel.$isEnabled.subscribe(in: &self.cancellables) {  [weak self] isEnabled in
            guard let self = self else { return }
            self.componentView.isEnabled = isEnabled
        }
    }

    // MARK: - Create View
    static func makeFormField(_ viewModel: FormFieldComponentUIViewModel) -> FormFieldUIView {
        let component: UIControl!

        switch viewModel.componentStyle {
        case .basic:
            component = Self.makeBasicView()
        case .singleCheckbox:
            component = Self.makeSingleCheckbox()
        case .verticalCheckbox:
            component = Self.makeVerticalCheckbox()
        case .horizontalCheckbox:
            component = Self.makeHorizontalCheckbox()
        case .horizontalScrollableCheckbox:
            component = Self.makeHorizontalScrollableCheckbox()
        case .singleRadioButton:
            component = Self.makeSingleRadioButton()
        case .verticalRadioButton:
            component = Self.makeVerticalRadioButton()
        case .horizontalRadioButton:
            component = Self.makeHorizontalRadioButton()
        case .textField:
            component = Self.makeTextField()
        case .addOnTextField:
            component = Self.makeAddOnTextField()
        case .ratingInput:
            component = Self.makeRatingInput()
        }

        return .init(
            theme: viewModel.theme,
            intent: .support,
            title: "Agreement",
            description: "Your agreement is important to us.",
            component: component
        )
    }

    static func makeBasicView() -> UIControl {
        let view = UIControl()
        view.backgroundColor = UIColor.lightGray
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }

    static func makeSingleCheckbox() -> UIControl {
        let view = CheckboxUIView(
            theme: SparkTheme.shared,
            text: "Hello World",
            checkedImage: DemoIconography.shared.checkmark.uiImage,
            selectionState: .unselected,
            alignment: .left
        )
        return view
    }

    static func makeVerticalCheckbox() -> UIControl {
        let view = CheckboxGroupUIView(
            checkedImage: DemoIconography.shared.checkmark.uiImage,
            items: [
                CheckboxGroupItemDefault(title: "Checkbox 1", id: "1", selectionState: .unselected, isEnabled: true),
                CheckboxGroupItemDefault(title: "Checkbox 2", id: "2", selectionState: .selected, isEnabled: true),
            ],
            theme: SparkTheme.shared,
            intent: .success,
            accessibilityIdentifierPrefix: "checkbox"
        )
        view.layout = .vertical
        return view
    }

    static func makeHorizontalCheckbox() -> UIControl {
        let view = CheckboxGroupUIView(
            checkedImage: DemoIconography.shared.checkmark.uiImage,
            items: [
                CheckboxGroupItemDefault(title: "Checkbox 1", id: "1", selectionState: .unselected, isEnabled: true),
                CheckboxGroupItemDefault(title: "Checkbox 2", id: "2", selectionState: .selected, isEnabled: true),
            ],
            theme: SparkTheme.shared,
            intent: .alert,
            accessibilityIdentifierPrefix: "checkbox"
        )
        view.layout = .horizontal
        return view
    }

    static func makeHorizontalScrollableCheckbox() -> UIControl {
        let view = CheckboxGroupUIView(
            checkedImage: DemoIconography.shared.checkmark.uiImage,
            items: [
                CheckboxGroupItemDefault(title: "Hello World", id: "1", selectionState: .unselected, isEnabled: true),
                CheckboxGroupItemDefault(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", id: "2", selectionState: .selected, isEnabled: true),
            ],
            theme: SparkTheme.shared,
            accessibilityIdentifierPrefix: "checkbox"
        )
        view.layout = .horizontal
        return view
    }

    static func makeSingleRadioButton() -> UIControl {
        let view = RadioButtonUIView(
            theme: SparkTheme.shared,
            intent: .info,
            id: "radiobutton",
            label: NSAttributedString(string: "Hello World"),
            isSelected: true
        )
        return view
    }

    static func makeVerticalRadioButton() -> UIControl {
        let view = RadioButtonUIGroupView(
            theme: SparkTheme.shared,
            intent: .danger,
            selectedID: "radiobutton",
            items: [
                RadioButtonUIItem(id: "1", label: "Radio Button 1"),
                RadioButtonUIItem(id: "2", label: "Radio Button 2"),
            ],
            groupLayout: .vertical
        )
        return view
    }

    static func makeHorizontalRadioButton() -> UIControl {
        let view = RadioButtonUIGroupView(
            theme: SparkTheme.shared,
            intent: .support,
            selectedID: "radiobutton",
            items: [
                RadioButtonUIItem(id: "1", label: "Radio Button 1"),
                RadioButtonUIItem(id: "2", label: "Radio Button 2"),
            ],
            groupLayout: .horizontal
        )
        return view
    }

    static func makeTextField() -> UIControl {
        let view = TextFieldUIView(
            theme: SparkTheme.shared,
            intent: .alert
        )
        view.text = "TextField"
        return view
    }

    static func makeAddOnTextField() -> UIControl {
        let view = TextFieldUIView(
            theme: SparkTheme.shared,
            intent: .alert
        )
        view.text = "I couldn't add addOnTextField. It is not UIControl for now"
        return view
    }

    static func makeRatingInput() -> UIControl {
        let view = RatingInputUIView(
            theme: SparkTheme.shared,
            intent: .main,
            rating: 2.0
        )
        return view
    }
}
