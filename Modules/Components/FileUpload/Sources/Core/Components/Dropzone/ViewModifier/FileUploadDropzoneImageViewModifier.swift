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
        let token = self.theme.fileUpload.dropzone

        content
            .sparkFrame(size: token.size.image)
            .foregroundStyle(token.colors.imageTint)
    }
}

extension View {

    func fileUploadDropzoneImage() -> some View {
        self.modifier(FileUploadDropzoneImageViewModifier())
    }
}
