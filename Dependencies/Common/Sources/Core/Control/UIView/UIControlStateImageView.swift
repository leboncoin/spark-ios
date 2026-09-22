//
//  UIControlStateImageView.swift
//  SparkCommon
//
//  Created by robin.lemaire on 25/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

/// The custom UIImageView which set the correct image from the state of the UIControl.
/// Must be used only on UIControl.
@available(*, deprecated, message: "Only used on deprecated button. Remove ASAP (13/03/2026")
@_spi(SI_SPI) public final class UIControlStateImageView: UIImageView {

    // MARK: - Properties

    private let imageStates = ControlPropertyStates<UIImage>()

    /// The image must be stored to lock the posibility to set the image directly like this **self.image = UIImage()**.
    /// When the storedImage is set (always from **setImage** function), it set the image.
    private var storedImage: UIImage? {
        didSet {
            self.isImage = self.storedImage != nil
            self.image = self.storedImage
        }
    }

    // MARK: - Published

    @Published public var isImage: Bool = false
    @Published public var imageChanged: Void = ()

    // MARK: - Override Properties

    /// It's not possible to set the image outside this class.
    /// The only possiblity to change the image is to use the **setImage(_: UIImage?, for: ControlState, on: UIControl)** function.
    override public var image: UIImage? {
        get {
            return super.image
        }
        set {
            if newValue == self.storedImage {
                super.image = newValue
                self.imageChanged = ()
            }
        }
    }

    // MARK: - Setter & Getter

    /// The image for a state.
    /// - parameter state: state of the image
    public func image(for state: ControlState) -> UIImage? {
        return self.imageStates.value(for: state)
    }

    /// Set the image for a state.
    /// - parameter image: new image
    /// - parameter state: state of the image
    /// - parameter control: the parent control
    public func setImage(
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
    public func updateContent(from control: UIControl) {
        // Create the status from the control
        let status = ControlStatus(
            isHighlighted: control.isHighlighted,
            isEnabled: control.isEnabled,
            isSelected: control.isSelected
        )

        // Set the image from states
        self.storedImage = self.imageStates.value(for: status)
    }
}
