//
//  FileUploadDropzoneGetColorsUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadDropzoneGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isTargeted: Bool
    ) -> FileUploadDropzoneColors
}

struct FileUploadDropzoneGetColorsUseCase: FileUploadDropzoneGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isTargeted: Bool
    ) -> FileUploadDropzoneColors {
        let colors = theme.colors
        let dims = theme.dims

        let backgroundColorToken: any ColorToken = isTargeted ? colors.states.surfacePressed : colors.base.surface

        return FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: colors.base.outline,
            imageTintColorToken: colors.base.onSurface,
            descriptionTextColorToken: colors.base.onSurface,
            additionalTextColorToken: colors.base.onSurface.opacity(dims.dim1)
        )
    }
}
