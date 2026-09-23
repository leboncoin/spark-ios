//
//  SparkFileUploadPreviewGroup.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton

/// A file upload preview group component that displays a vertical list of file upload previews.
///
/// This component manages a collection of ``FileUpload`` items and displays each one
/// using ``SparkFileUploadPreview``. Files can be removed from the list via the preview's remove action.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     @State private var files: [FileUpload] = []
///     @State private var theme = SparkTheme.shared
///
///     var body: some View {
///         VStack {
///             SparkFileUploadPreviewGroup(files: self.$files)
///                 .sparkTheme(self.theme)
///         }
///     }
/// }
/// ```
///
/// ## Rendering
///
/// ![Component rendering.](fileupload_preview_group.png)
///
public struct SparkFileUploadPreviewGroup: View {

    // MARK: - Properties

    @Binding private var files: [FileUpload]

    @Environment(\.theme) private var theme

    @StateObject private var viewModel = FileUploadPreviewGroupViewModel()
    @State private var fileToDelete: FileUpload?
    @State private var showDeleteAlert = false

    // MARK: - Initialization

    /// Creates a file upload preview group to display multiple file previews.
    ///
    /// Use this component to display a collection of uploaded or uploading files,
    /// each with the ability to be removed individually.
    ///
    /// - Parameter files: A binding to an array of ``FileUpload`` objects.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     @State private var files: [FileUpload] = []
    ///     @State private var theme = SparkTheme.shared
    ///
    ///     var body: some View {
    ///         VStack {
    ///             SparkFileUploadPreviewGroup(files: self.$files)
    ///                 .sparkTheme(self.theme)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_preview_group.png)
    ///
    public init(files: Binding<[FileUpload]>) {
        self._files = files
    }

    // MARK: - View

    public var body: some View {
        SparkLazyVStack(spacing: self.viewModel.layout.spacing) {
            ForEach(self.files, id: \.id) { file in
                SparkFileUploadPreview(
                    file: file,
                    removeAction: {
                        self.files.removeAll(where: { $0.id == file.id })
                    }
                )
            }
        }
        .accessibilityIdentifier(FileUploadPreviewGroupAccessibilityIdentifier.view)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
    }
}
