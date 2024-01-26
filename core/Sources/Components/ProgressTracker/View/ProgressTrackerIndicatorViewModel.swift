//
//  ProgressTrackerIndicatorViewModel.swift
//  SparkCore
//
//  Created by Michael Zimmermann on 22.01.24.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import Foundation
import SwiftUI

/// A view model for a single Progress Tracker Indicator 
final class ProgressTrackerIndicatorViewModel<ComponentContent: ProgressTrackerContentIndicating>: ObservableObject {

    var theme: Theme {
        didSet {
            self.updateColors()
            self.font = theme.typography.body2Highlight
        }
    }

    var intent: ProgressTrackerIntent {
        didSet {
            guard self.intent != oldValue else { return }
            self.updateColors()
        }
    }

    var variant: ProgressTrackerVariant {
        didSet {
            guard self.variant != oldValue else { return }
            self.updateColors()
        }
    }

    var state: ProgressTrackerState {
        didSet {
            guard self.state != oldValue else { return }
            self.updateColors()
        }
    }

    private let colorsUseCase: ProgressTrackerGetColorsUseCaseable

    @Published var size: ProgressTrackerSize
    @Published var content: ComponentContent
    @Published var colors: ProgressTrackerColors
    @Published var font: TypographyFontToken

    init(theme: Theme, 
         intent: ProgressTrackerIntent,
         variant: ProgressTrackerVariant,
         size: ProgressTrackerSize,
         content: ComponentContent,
         state: ProgressTrackerState = .normal,
         colorsUseCase: ProgressTrackerGetColorsUseCaseable = ProgressTrackerGetColorsUseCase()
    ) {
        self.theme = theme
        self.intent = intent
        self.variant = variant
        self.size = size
        self.content = content
        self.colorsUseCase = colorsUseCase
        self.state = state

        self.colors = colorsUseCase.execute(theme: theme, intent: intent, variant: variant, state: state)

        self.font = theme.typography.body2Highlight
    }

    private func updateColors() {
        self.colors = self.colorsUseCase.execute(theme: theme, intent: intent, variant: variant, state: self.state)
    }

    func set(enabled: Bool) {
        self.state.isEnabled = enabled
    }
}
