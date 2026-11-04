//
//  SparkFileUploadButtonStyle.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 20/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton

/// A button style that applies file upload styling to a ``SparkButton``.
///
/// This style configures the button with specific intent, providing consistent
/// styling for file upload buttons across the application.
public struct SparkFileUploadButtonStyle: SparkButtonStyle {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    /// Creates and configures the button style.
    ///
    /// - Parameter content: The button content to style.
    /// - Returns: A view with the file upload button style applied.
    public func body(content: Content) -> some View {
        let styles = self.theme.fileUpload.button.styles

        content
            .sparkButtonIntent(styles.intent)
            .sparkButtonVariant(styles.variant)
            .sparkButtonAlignment(styles.alignment)
    }
}

// MARK: - Extension

public extension SparkButtonStyle where Self == SparkFileUploadButtonStyle {

    /// A button style that applies file upload styles on the ``SparkButton``.
    ///
    /// **Note** : If you use this style, please do not update the button  :
    /// - intent
    /// - size
    /// - variant
    /// - alignment
    @MainActor @preconcurrency static var fileUpload: SparkFileUploadButtonStyle {
        .init()
    }
}
