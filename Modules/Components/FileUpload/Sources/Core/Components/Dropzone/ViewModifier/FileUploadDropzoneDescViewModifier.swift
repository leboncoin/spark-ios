//
//  FileUploadDropzoneDescViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadDropzoneDescViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.dropzone

        content
            .font(token.typography.descriptionText)
            .foregroundStyle(token.colors.descriptionText)
            .multilineTextAlignment(.center)
    }
}

extension View {

    func fileUploadDropzoneDescription() -> some View {
        self.modifier(FileUploadDropzoneDescViewModifier())
    }
}
