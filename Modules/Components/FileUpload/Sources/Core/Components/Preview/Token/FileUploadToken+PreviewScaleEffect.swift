//
//  FileUploadToken+PreviewScaleEffect.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Scale Effect

public extension FileUploadToken.Preview {

    /// Contains the theme-independent scale effect values of the Preview.
    struct ScaleEffect: Equatable {

        // MARK: - Methods

        /// The scale effect of the preview. One when not pressed.
        public func value(isPressed: Bool) -> CGFloat {
            return isPressed ? 1.02 : 1.0
        }
    }
}
