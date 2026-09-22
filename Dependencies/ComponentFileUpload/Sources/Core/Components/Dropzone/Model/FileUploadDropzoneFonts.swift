//
//  FileUploadDropzoneFonts.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct FileUploadDropzoneFonts: Equatable {

    // MARK: - Properties

    var descriptionFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var additionalTextFontToken: any TypographyFontToken = TypographyFontTokenClear()
}

// MARK: - Hashable & Equatable

extension FileUploadDropzoneFonts {

    static func == (lhs: FileUploadDropzoneFonts, rhs: FileUploadDropzoneFonts) -> Bool {
        return lhs.descriptionFontToken.equals(rhs.descriptionFontToken) &&
        lhs.additionalTextFontToken.equals(rhs.additionalTextFontToken)
    }
}
