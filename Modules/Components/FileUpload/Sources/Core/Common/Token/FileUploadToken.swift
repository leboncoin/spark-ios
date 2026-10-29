//
//  FileUploadToken.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Token

/// Contains all token values for the FileUpload components, grouped by sub-component.
///
/// The ``FileUploadToken`` provides:
/// - **Dropzone** (``FileUploadToken/Dropzone``): border, colors, layout, typography of ``SparkFileUploadDropzone``
/// - **Preview** (``FileUploadToken/Preview``): border, colors, layout and typography of the ``SparkFileUploadPreview``
/// - **Preview group** (``FileUploadToken/PreviewGroup``): layout of the ``SparkFileUploadPreviewGroup``
///
/// > Tip: The token is available from the theme with `theme.component.fileUpload`.
/// > If you only need specific tokens, use the individual sub-components directly.
/// > For example, use `theme.component.fileUpload.dropzone.colors`.
///
/// ## Example
///
/// ```swift
/// let token = theme.component.fileUpload
///
/// let borderWidth = token.dropzone.border.width
/// let backgroundColor = token.dropzone.colors.background(isTargeted: true)
/// let spacing = token.previewGroup.layout.spacing
/// ```
///
public struct FileUploadToken: Equatable {

    // MARK: - Properties

    /// The dropzone token values.
    public let dropzone: Dropzone

    /// The preview token values.
    public let preview: Preview

    /// The preview group token values.
    public let previewGroup: PreviewGroup

    // MARK: - Initialization

    /// Creates a FileUploadToken with the given theme.
    ///
    /// - Parameter theme: The theme to use for token values.
    public init(theme: any Theme) {
        self.dropzone = .init(theme: theme)
        self.preview = .init(theme: theme)
        self.previewGroup = .init(theme: theme)
    }
}
