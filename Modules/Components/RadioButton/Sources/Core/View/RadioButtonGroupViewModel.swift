//
//  RadioButtonGroupViewModel.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 28.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import SparkTheming

/// The RadioButtonGroupViewModel is a view model used by the ``RadioButtonView`` to handle theming logic and state changes.
final class RadioButtonGroupViewModel: ObservableObject {

    // MARK: - Published Properties
    @Published var spacing: CGFloat
    @Published var isDisabled: Bool

    // MARK: - Internal Properties
    var theme: any Theme {
        didSet {
            self.spacing = self.theme.layout.spacing.large
        }
    }

    var intent: RadioButtonIntent {
        didSet {
            guard self.intent != oldValue else { return }
        }
    }

    // MARK: Private Properties
    private let useCase: any RadioButtonGetGroupColorUseCaseable

    // MARK: Initializers
    convenience init(
        theme: any Theme,
        intent: RadioButtonIntent
    ) {
        self.init(
            theme: theme,
            intent: intent,
            useCase: RadioButtonGetGroupColorUseCase()
        )
    }

    init(theme: any Theme,
         intent: RadioButtonIntent,
         useCase: any RadioButtonGetGroupColorUseCaseable) {

        self.theme = theme
        self.intent = intent
        self.useCase = useCase
        self.isDisabled = false

        self.spacing = self.theme.layout.spacing.large
    }
}

