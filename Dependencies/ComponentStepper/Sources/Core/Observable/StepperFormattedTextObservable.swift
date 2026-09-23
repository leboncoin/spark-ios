//
//  StepperFormattedTextObservable.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Used only for SwiftUI.
final class StepperFormattedTextObservable<V>: ObservableObject where V: Strideable {

    // MARK: - Properties

    private var value: V
    private var formattedText: () -> String = { "" }

    // MARK: - Initialization

    init(value: V) {
        self.value = value
        self.formattedText = { [weak self] in
            guard let self else { return "" }
            return "\(self.value)"
        }
    }

    init<F>(value: V, format: F) where F: ParseableFormatStyle, F.FormatInput == V, F.FormatOutput == String {
        self.value = value
        self.formattedText = { [weak self] in
            guard let self else { return "" }
            return format.format(self.value)
        }
    }

    // MARK: - Setter

    func setValue(_ value: V) {
        self.value = value
        self.objectWillChange.send()
    }

    // MARK: - Getter

    func getText() -> String {
        self.formattedText()
    }
}
