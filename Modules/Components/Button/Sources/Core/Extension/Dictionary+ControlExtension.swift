//
//  Dictionary+ControlExtension.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 19/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

extension Dictionary where Key == UInt {

    // MARK: - Getter

    func value(for state: UIControl.State) -> Value? {
        self[state.rawValue]
    }

    func valueForCurrentState(on control: UIControl) -> Value? {
        // Priority: highlighted > disabled > selected > normal
        if control.isHighlighted, let image = self.value(for: .highlighted) {
            return image
        }

        if !control.isEnabled, let image = self.value(for: .disabled) {
            return image
        }

        if control.isSelected, let image = self.value(for: .selected) {
            return image
        }

        return self.value(for: .normal)
    }

    // MARK: - Setter

    @discardableResult
    mutating func setValue(
        _ value: Value?,
        for state: UIControl.State
    ) -> Bool {
        if let value {
            self[state.rawValue] = value
            return true
        } else {
            self.removeValue(for: state)
            return false
        }
    }

    mutating func removeValue(for state: UIControl.State) {
        self.removeValue(forKey: state.rawValue)
    }
}
