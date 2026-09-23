//
//  ProgressTrackerTrackViewModel.swift
//  SparkComponentProgressTracker
//
//  Created by Michael Zimmermann on 30.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// A view model for the Progress Tracker Track
final class ProgressTrackerTrackViewModel: ObservableObject {

    var theme: any Theme {
        didSet {
            self.updateLineColor()
        }
    }

    var intent: ProgressTrackerIntent {
        didSet {
            guard self.intent != oldValue else { return }
            self.updateLineColor()
        }
    }

    var isEnabled: Bool {
        didSet {
            guard self.isEnabled != oldValue else { return }
            self.updateOpacity()
        }
    }

    private var useCase: any ProgressTrackerGetTrackColorUseCaseable
    @Published var lineColor: any ColorToken
    @Published var opacity: CGFloat = 1.0

    // MARK: - Initialization
    init(theme: any Theme,
         intent: ProgressTrackerIntent,
         isEnabled: Bool = true,
         useCase: any ProgressTrackerGetTrackColorUseCaseable = ProgressTrackerGetTrackColorUseCase()
    ) {
        self.theme = theme
        self.intent = intent
        self.useCase = useCase
        self.isEnabled = isEnabled
        self.lineColor = useCase.execute(colors: theme.colors, intent: intent)
        self.updateOpacity()
    }

    private func updateLineColor() {
        let newLineColor = useCase.execute(colors: theme.colors, intent: intent)
        if !newLineColor.equals(self.lineColor) {
            self.lineColor = newLineColor
        }
    }

    private func updateOpacity() {
        self.opacity = self.isEnabled ? 1.0 : self.theme.dims.dim3
    }
}
