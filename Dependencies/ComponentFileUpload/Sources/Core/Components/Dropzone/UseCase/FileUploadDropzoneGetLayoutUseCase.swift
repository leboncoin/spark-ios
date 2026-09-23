//
//  FileUploadDropzoneGetLayoutUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadDropzoneGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> FileUploadDropzoneLayout
}

struct FileUploadDropzoneGetLayoutUseCase: FileUploadDropzoneGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> FileUploadDropzoneLayout {
        let layout = theme.layout

        return FileUploadDropzoneLayout(
            verticalSpacing: layout.spacing.large,
            subVerticalSpacing: layout.spacing.medium,
            padding: layout.spacing.large
        )
    }
}
