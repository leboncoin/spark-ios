//
//  FileUploadPreviewGetLayoutUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme
    ) -> FileUploadPreviewLayout
}

struct FileUploadPreviewGetLayoutUseCase: FileUploadPreviewGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme
    ) -> FileUploadPreviewLayout {
        let layout = theme.layout

        let spacing = layout.spacing.medium
        let horizontalPadding = layout.spacing.medium
        let verticalPadding = layout.spacing.medium

        return FileUploadPreviewLayout(
            spacing: spacing,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding
        )
    }
}
