//
//  FileUploadDropzoneImageViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadDropzoneImageViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .sparkFrame(size: FileUploadDropzoneConstants.imageSize)
            .foregroundStyle(self.theme.fileUpload.dropzone.colors.imageTint)
    }
}

extension View {

    func fileUploadDropzoneImage() -> some View {
        self.modifier(FileUploadDropzoneImageViewModifier())
    }
}
