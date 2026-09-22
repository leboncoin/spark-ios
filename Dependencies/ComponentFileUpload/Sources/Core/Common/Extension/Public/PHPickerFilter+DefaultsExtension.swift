//
//  PHPickerFilter+DefaultsExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import PhotosUI

public extension Array where ArrayLiteralElement == PHPickerFilter {

    /// The default PHPickerFilter array used by Spark components.
    ///
    /// This property provides a default configuration for PHPicker that includes:
    /// - `.images`: Allows selection of image files
    /// - `.videos`: Allows selection of video files
    ///
    /// Use this as a default filter when implementing photo/video picker functionality
    /// in Spark components to maintain consistency across the design system.
    static var sparkDefaults: [ArrayLiteralElement] {
        [.images, .videos]
    }
}
