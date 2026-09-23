//
//  FileUploadPreviewGetFontsUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGetFontsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme
    ) -> FileUploadPreviewFonts
}

struct FileUploadPreviewGetFontsUseCase: FileUploadPreviewGetFontsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme
    ) -> FileUploadPreviewFonts {
        let typography = theme.typography

        return FileUploadPreviewFonts(
            nameFontToken: typography.caption,
            sizeFontToken: typography.caption,
            errorFontToken: typography.caption
        )
    }
}
