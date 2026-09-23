//
//  UTType+DefaultsExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import PhotosUI

public extension Array where ArrayLiteralElement == UTType {

    /// The default UTType array used by Spark components for file selection.
    ///
    /// This property provides a default configuration for file pickers that includes:
    /// - `.pdf`: PDF documents
    /// - `.movie`: Video files
    /// - `.image`: Image files
    /// - `.text`: Text documents
    /// - `.plainText`: Plain text files
    ///
    /// Use this as a default content type filter when implementing file upload functionality
    /// in Spark components to maintain consistency across the design system.
    static var sparkDefaults: [ArrayLiteralElement] {
        [.pdf, .movie, .image, .text, .plainText]
    }
}
