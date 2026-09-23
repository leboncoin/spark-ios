//
//  FileUploadDropzoneGetBorderUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadDropzoneGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> FileUploadDropzoneBorder
}

struct FileUploadDropzoneGetBorderUseCase: FileUploadDropzoneGetBorderUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> FileUploadDropzoneBorder {
        let border = theme.border

        return FileUploadDropzoneBorder(
            width: border.width.small,
            radius: border.radius.large
        )
    }
}
