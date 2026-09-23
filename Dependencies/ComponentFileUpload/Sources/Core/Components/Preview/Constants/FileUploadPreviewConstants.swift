//
//  FileUploadPreviewConstants.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkComponentButton
import Foundation

enum FileUploadPreviewConstants {

    // MARK: - Properties

    static let pressedScaled: CGFloat = 1.02

    static let animationDuration = 0.1

    enum Button {
        static let intent: ButtonIntent = .surface
        static let variant: ButtonVariant = .contrast
        static let size: ButtonSize = .small
    }

    enum Image {
        static let size: CGFloat = 24
        static let containerSize: CGFloat = 36
    }
}
