//
//  FileUploadPreviewGroupGetLayoutUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGroupGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme
    ) -> FileUploadPreviewGroupLayout
}

struct FileUploadPreviewGroupGetLayoutUseCase: FileUploadPreviewGroupGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme
    ) -> FileUploadPreviewGroupLayout {
        let layout = theme.layout

        return FileUploadPreviewGroupLayout(
            spacing: layout.spacing.medium
        )
    }
}
