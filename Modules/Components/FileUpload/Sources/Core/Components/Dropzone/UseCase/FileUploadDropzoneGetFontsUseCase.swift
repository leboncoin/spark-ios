//
//  FileUploadDropzoneGetFontsUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadDropzoneGetFontsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> FileUploadDropzoneFonts
}

struct FileUploadDropzoneGetFontsUseCase: FileUploadDropzoneGetFontsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> FileUploadDropzoneFonts {
        let typography = theme.typography

        return FileUploadDropzoneFonts(
            descriptionFontToken: typography.body1Highlight,
            additionalTextFontToken: typography.caption
        )
    }
}
