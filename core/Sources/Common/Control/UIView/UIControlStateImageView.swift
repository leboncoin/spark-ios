//
//  UIControlStateImageView.swift
//  SparkCore
//
//  Created by robin.lemaire on 25/10/2023.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import UIKit

/// The custom UIImageView which set the correct image from the state of the UIControl.
/// Must be used only on UIControl.
final class UIControlStateImageView: UIImageView {

    // MARK: - Properties

    private let imageStates = ControlPropertyStates<UIImage>()

    // MARK: - Setter & Getter

    /// The image for a state.
    /// - parameter state: state of the image
    func image(for state: ControlState) -> UIImage? {
        return self.imageStates.value(forState: state)
    }

    /// Set the image for a state.
    /// - parameter image: new image
    /// - parameter state: state of the image
    /// - parameter control: the parent control 
    func setImage(
        _ image: UIImage?,
        for state: ControlState,
        on control: UIControl
    ) {
        self.imageStates.setValue(image, for: state)
        self.updateContent(from: control)
    }

    // MARK: - Update UI

    /// Update the image for a parent control state.
    /// - parameter control: the parent control
    func updateContent(from control: UIControl) {
        // Create the status from the control
        let status = ControlStatus(
            isHighlighted: control.isHighlighted,
            isEnabled: control.isEnabled,
            isSelected: control.isSelected
        )

        // Set the image from states
        self.image = self.imageStates.value(forStatus: status)
    }
}
