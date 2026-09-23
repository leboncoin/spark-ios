//
//  FileUploadPreviewColors.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct FileUploadPreviewColors: Equatable {

    // MARK: - Properties

    var backgroundColorToken: any ColorToken = ColorTokenClear()
    var borderColorToken: any ColorToken = ColorTokenClear()
    var imageTintColorToken: any ColorToken = ColorTokenClear()
    var imageBackgroundColorToken: any ColorToken = ColorTokenClear()
    var nameTextColorToken: any ColorToken = ColorTokenClear()
    var sizeTextColorToken: any ColorToken = ColorTokenClear()
    var errorTextColorToken: any ColorToken = ColorTokenClear()
}

// MARK: - Hashable & Equatable

extension FileUploadPreviewColors {

    static func == (lhs: FileUploadPreviewColors, rhs: FileUploadPreviewColors) -> Bool {
        return lhs.backgroundColorToken.equals(rhs.backgroundColorToken) &&
        lhs.borderColorToken.equals(rhs.borderColorToken) &&
        lhs.imageTintColorToken.equals(rhs.imageTintColorToken) &&
        lhs.imageBackgroundColorToken.equals(rhs.imageBackgroundColorToken) &&
        lhs.nameTextColorToken.equals(rhs.nameTextColorToken) &&
        lhs.sizeTextColorToken.equals(rhs.sizeTextColorToken) &&
        lhs.errorTextColorToken.equals(rhs.errorTextColorToken)
    }
}
