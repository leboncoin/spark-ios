//
//  SparkFileUploadDropzone.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import UniformTypeIdentifiers
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton

/// A file upload dropzone component that allows users to drag and drop files or browse for files.
///
/// The dropzone provides a designated area where users can either drag and drop files from their desktop
/// or click to browse and select files from their device. It supports visual feedback when files are dragged over,
/// customizable labels, icons, and file type filtering.
///
/// ## Features
///
/// - Drag and drop files directly into the dropzone
/// - Click-to-browse alternative using system file picker
/// - Visual feedback with border highlight during drag operations
/// - Customizable content with text or custom view labels
/// - File type filtering using `UTType`
/// - Integrates with ``SparkFileUploadButton`` for file selection
///
/// ## Basic Usage
///
/// ```swift
/// @State private var files: [FileUpload] = []
///
/// SparkFileUploadDropzone(
///     icon: Image(systemName: "arrow.up.doc"),
///     descriptionText: "Drag and drop a file or",
///     additionalText: ".png, .jpg up to 5MB",
///     files: $files
/// ) {
///     SparkFileUploadButton(
///         "Browse my files",
///         files: $files
///     )
/// }
/// .sparkTheme(theme)
/// ```
///
/// ## Usage with Labels
///
/// ```swift
/// SparkFileUploadDropzone(
///     files: self.$files,
///     descriptionLabel: {
///         VStack {
///             Text("Upload files")
///             Text("Drag and drop or browse")
///         }
///     },
///     uploadButton: {
///         SparkFileUploadButton(
///             "Browse",
///             files: self.$files
///         )
///     },
///     additionalLabel: {
///         Text("Max 5MB")
///             .font(.caption)
///     }
/// )
/// .sparkTheme(self.theme)
/// ```
///
/// ## Rendering
///
/// ![Component rendering.](fileupload_dropzone_default.png)
///
public struct SparkFileUploadDropzone<DescriptionLabel, UploadButton, AdditionalLabel>: View where DescriptionLabel: View, UploadButton: View, AdditionalLabel: View {

    // MARK: - Properties

    private var icon: Image?
    private var descriptionLabel: () -> DescriptionLabel
    private var uploadButton: () -> UploadButton
    private var additionalLabel: () -> AdditionalLabel
    private var fileTypes: [UTType]

    @Binding private var files: [FileUpload]

    @Environment(\.theme) private var theme

    @StateObject private var viewModel = FileUploadDropzoneViewModel()
    @StateObject private var services = FileUploadDropzoneServices()

    @State private var isTargeted = false
    @State private var targetFeedbackID: UUID = UUID()

    // MARK: - Initialization

    /// Creates a dropzone to upload files with custom description and additional labels.
    ///
    /// Use this initializer when you need custom control over both label views.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - files: A binding to an array of ``FileUpload` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - descriptionLabel: A view builder that creates the custom description label.
    ///   - uploadButton: A view builder that creates the upload button.
    ///   - additionalLabel: A view builder that creates the custom additional label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkFileUploadDropzone(
    ///     icon: Image(systemName: "arrow.up.doc"),
    ///     files: self.$files,
    ///     descriptionLabel: {
    ///         Text("Custom Description")
    ///             .font(.headline)
    ///     },
    ///     uploadButton: {
    ///         SparkFileUploadButton(
    ///             "Browse",
    ///             files: self.$files
    ///         )
    ///     },
    ///     additionalLabel: {
    ///         Text("Max 5MB")
    ///             .font(.caption)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    ///
    public init(
        icon: Image? = nil,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = [.item],
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel,
        @ViewBuilder uploadButton: @escaping () -> UploadButton,
        @ViewBuilder additionalLabel: @escaping () -> AdditionalLabel
    ) {
        self.icon = icon
        self._files = files
        self.fileTypes = fileTypes
        self.descriptionLabel = descriptionLabel
        self.uploadButton = uploadButton
        self.additionalLabel = additionalLabel
    }

    // MARK: - View

    public var body: some View {
        SparkVStack(spacing: self.viewModel.layout.verticalSpacing) {
            // Icon
            self.icon?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .sparkFrame(size: FileUploadDropzoneConstants.imageSize)
                .foregroundStyle(self.viewModel.colors.imageTintColorToken)
                .accessibilityHidden(true)

            SparkVStack(spacing: self.viewModel.layout.subVerticalSpacing) {
                // Description text
                self.descriptionLabel()
                    .font(self.viewModel.fonts.descriptionFontToken)
                    .foregroundStyle(self.viewModel.colors.descriptionTextColorToken)
                    .multilineTextAlignment(.center)

                // Upload button
                self.uploadButton()

                // Additional text
                self.additionalLabel()
                    .font(self.viewModel.fonts.additionalTextFontToken)
                    .foregroundStyle(self.viewModel.colors.additionalTextColorToken)
                    .multilineTextAlignment(.center)
            }
        }
        .sparkPadding(self.viewModel.layout.padding)
        .frame(maxWidth: .infinity)
        .background(self.viewModel.colors.backgroundColorToken.color)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            dash: FileUploadDropzoneConstants.borderDashed,
            colorToken: self.viewModel.colors.borderColorToken,
            position: .inner
        )
        .onDrop(of: self.fileTypes, isTargeted: self.$isTargeted) { providers in
            self.handleDrop(providers: providers)
            return true
        }
        .sparkSensoryFeedback(.selection, trigger: self.targetFeedbackID)
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(FileUploadDropzoneAccessibilityIdentifier.view)
        .onAppear {
            self.viewModel.setup(
                theme: self.theme.value
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.isTargeted) { isTargeted in
            self.viewModel.isTargeted = isTargeted
            self.targetFeedbackID = .init()
        }
    }

    // MARK: - Private Methods

    private func handleDrop(providers: [NSItemProvider]) {
        Task {
            let newFiles = await self.services.fetchDroppedFiles.execute(
                from: providers,
                existingFiles: self.files
            )

            await MainActor.run {
                self.files.appendIfUnique(newFiles)
            }
        }
    }
}
