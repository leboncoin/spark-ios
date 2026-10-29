//
//  FileUploadDropzoneContainerViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadDropzoneContainerViewModifier: ViewModifier {

    // MARK: - Properties

    let isTargeted: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.dropzone

        content
            .sparkPadding(token.layout.padding)
            .frame(maxWidth: .infinity)
            .background(token.colors.background(isTargeted: self.isTargeted).color)
            .sparkBorder(
                width: token.border.width,
                radius: token.border.radius,
                dash: FileUploadDropzoneConstants.borderDashed,
                colorToken: token.colors.border,
                position: .inner
            )
    }
}

extension View {

    func fileUploadDropzoneContainer(isTargeted: Bool) -> some View {
        self.modifier(FileUploadDropzoneContainerViewModifier(isTargeted: isTargeted))
    }
}
