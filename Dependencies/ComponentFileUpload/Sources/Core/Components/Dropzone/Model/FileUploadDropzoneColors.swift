//
//  FileUploadDropzoneColors.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct FileUploadDropzoneColors: Equatable {

    // MARK: - Properties

    var backgroundColorToken: any ColorToken = ColorTokenClear()
    var borderColorToken: any ColorToken = ColorTokenClear()
    var imageTintColorToken: any ColorToken = ColorTokenClear()
    var descriptionTextColorToken: any ColorToken = ColorTokenClear()
    var additionalTextColorToken: any ColorToken = ColorTokenClear()
}

// MARK: - Hashable & Equatable

extension FileUploadDropzoneColors {

    static func == (lhs: FileUploadDropzoneColors, rhs: FileUploadDropzoneColors) -> Bool {
        return lhs.backgroundColorToken.equals(rhs.backgroundColorToken) &&
        lhs.borderColorToken.equals(rhs.borderColorToken) &&
        lhs.imageTintColorToken.equals(rhs.imageTintColorToken) &&
        lhs.descriptionTextColorToken.equals(rhs.descriptionTextColorToken) &&
        lhs.additionalTextColorToken.equals(rhs.additionalTextColorToken)
    }
}
