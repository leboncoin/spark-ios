//
//  FileUploadPreviewGetColorsUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        file: FileUpload,
        isPressed: Bool
    ) -> FileUploadPreviewColors
}

struct FileUploadPreviewGetColorsUseCase: FileUploadPreviewGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        file: FileUpload,
        isPressed: Bool
    ) -> FileUploadPreviewColors {
        let colors = theme.colors
        let dims = theme.dims

        let backgroundColorToken = isPressed ? colors.states.surfacePressed : colors.base.surface
        let nameTextColorToken = colors.base.onSurface
        let sizeTextColorToken = colors.base.onSurface.opacity(dims.dim1)
        let errorTextColorToken = colors.feedback.error

        let borderColorToken: any ColorToken
        let imageTintColorToken: any ColorToken
        let imageBackgroundColorToken: any ColorToken

        switch file.result {
        case .success:
            borderColorToken = colors.base.outline
            imageTintColorToken = colors.feedback.onNeutralContainer
            imageBackgroundColorToken = colors.feedback.neutralContainer
        case .failure:
            borderColorToken = colors.feedback.error
            imageTintColorToken = colors.feedback.onErrorContainer
            imageBackgroundColorToken = colors.feedback.errorContainer
        }

        return FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )
    }
}
