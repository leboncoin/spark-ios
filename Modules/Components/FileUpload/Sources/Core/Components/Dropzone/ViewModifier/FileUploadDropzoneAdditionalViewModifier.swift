//
//  FileUploadDropzoneAdditionalViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadDropzoneAdditionalViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.dropzone

        content
            .font(token.typography.additionalText)
            .foregroundStyle(token.colors.additionalText)
            .multilineTextAlignment(.center)
    }
}

extension View {

    func fileUploadDropzoneAdditionalText() -> some View {
        self.modifier(FileUploadDropzoneAdditionalViewModifier())
    }
}
