//
//  FileUploadPreviewFonts.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct FileUploadPreviewFonts: Equatable {

    // MARK: - Properties

    var nameFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var sizeFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var errorFontToken: any TypographyFontToken = TypographyFontTokenClear()
}

// MARK: - Hashable & Equatable

extension FileUploadPreviewFonts {

    static func == (lhs: FileUploadPreviewFonts, rhs: FileUploadPreviewFonts) -> Bool {
        return lhs.nameFontToken.equals(rhs.nameFontToken) &&
        lhs.sizeFontToken.equals(rhs.sizeFontToken) &&
        lhs.errorFontToken.equals(rhs.errorFontToken)
    }
}
