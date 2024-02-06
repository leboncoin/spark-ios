//
//  TextFieldComponentUIView.swift
//  SparkDemo
//
//  Created by louis.borlee on 24/01/2024.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import Combine
import UIKit
import SparkCore

// swiftlint:disable no_debugging_method
final class TextFieldComponentUIView: ComponentUIView {

    private let viewModel: TextFieldComponentUIViewModel
    private let textField: TextFieldUIView
    private var cancellables: Set<AnyCancellable> = []

    init(viewModel: TextFieldComponentUIViewModel) {
        self.viewModel = viewModel

        self.textField = .init(
            theme: viewModel.theme,
            intent: viewModel.intent,
            successImage: .init(named: "check") ?? UIImage(),
            alertImage: .init(named: "alert") ?? UIImage(),
            errorImage: .init(named: "alert-circle") ?? UIImage()
        )

        super.init(viewModel: viewModel, componentView: self.textField)

        self.textField.placeholder = "Hello there how are you doing"
        self.textField.delegate = self
        self.setupSubscriptions()
    }

    func setupSubscriptions() {
        self.viewModel.$theme.subscribe(in: &self.cancellables) { [weak self] theme in
            guard let self else { return }
            let themes = self.viewModel.themes
            let themeTitle: String? = theme is SparkTheme ? themes.first?.title : themes.last?.title

            self.viewModel.themeConfigurationItemViewModel.buttonTitle = themeTitle
            self.viewModel.configurationViewModel.update(theme: theme)
            self.textField.theme = theme
        }

        self.viewModel.$intent.subscribe(in: &self.cancellables) { [weak self] intent in
            guard let self else { return }
            self.viewModel.intentConfigurationItemViewModel.buttonTitle = intent.name
            self.textField.intent = intent
        }

        self.viewModel.$isEnabled.subscribe(in: &self.cancellables) { [weak self] isEnabled in
            guard let self = self else { return }
            self.viewModel.isEnabledConfigurationItemViewModel.isOn = isEnabled
            self.textField.isEnabled = isEnabled
        }

        self.viewModel.$isUserInteractionEnabled.subscribe(in: &self.cancellables) { [weak self] isUserInteractionEnabled in
            guard let self = self else { return }
            self.viewModel.isUserInteractionEnabledConfigurationItemViewModel.isOn = isUserInteractionEnabled
            self.textField.isUserInteractionEnabled = isUserInteractionEnabled
        }

        self.viewModel.$clearButtonMode.subscribe(in: &self.cancellables) { [weak self] viewMode in
            guard let self else { return }
            self.viewModel.clearButtonModeConfigurationItemViewModel.buttonTitle = viewMode.name
            self.textField.clearButtonMode = viewMode
        }

        self.viewModel.$leftViewMode.subscribe(in: &self.cancellables) { [weak self] viewMode in
            guard let self else { return }
            self.viewModel.leftViewModeConfigurationItemViewModel.buttonTitle = viewMode.name
            self.textField.leftViewMode = viewMode
        }

        self.viewModel.$rightViewMode.subscribe(in: &self.cancellables) { [weak self] viewMode in
            guard let self else { return }
            self.viewModel.rightViewModeConfigurationItemViewModel.buttonTitle = viewMode.name
            self.textField.rightViewMode = viewMode
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextFieldComponentUIView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
