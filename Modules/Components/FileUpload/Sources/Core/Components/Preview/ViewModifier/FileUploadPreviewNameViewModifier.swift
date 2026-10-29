//
//  FileUploadPreviewNameViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadPreviewNameViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.preview

        content
            .font(token.typography.name)
            .foregroundStyle(token.colors.nameText)
    }
}

extension View {

    func fileUploadPreviewName() -> some View {
        self.modifier(FileUploadPreviewNameViewModifier())
    }
}
