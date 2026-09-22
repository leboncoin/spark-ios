//
//  FileUploadPreviewGetBorderUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        file: FileUpload
    ) -> FileUploadPreviewBorder
}

struct FileUploadPreviewGetBorderUseCase: FileUploadPreviewGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        file: FileUpload
    ) -> FileUploadPreviewBorder {
        let border = theme.border

        let radius = border.radius.medium

        let width: CGFloat = switch file.result {
        case .success: border.width.small
        case .failure: border.width.medium
        }

        return FileUploadPreviewBorder(
            width: width,
            radius: radius,
            imageRadius: border.width.medium
        )
    }
}
