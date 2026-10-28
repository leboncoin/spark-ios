//
//  FileUploadPreviewImageViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadPreviewImageViewModifier: ViewModifier {

    // MARK: - Properties

    let isSucceed: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.preview

        content
            .frame(size: token.size.image, alignment: .center)
            .foregroundStyle(token.colors.imageTint(isSucceed: self.isSucceed))
    }
}

extension View {

    func fileUploadPreviewImage(isSucceed: Bool) -> some View {
        self.modifier(FileUploadPreviewImageViewModifier(isSucceed: isSucceed))
    }
}
