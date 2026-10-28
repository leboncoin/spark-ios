//
//  SparkFileUploadPreview.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton
import SparkResources

/// A file upload preview component that displays file information with an icon, name, size, and optional error message.
///
/// The preview component provides a visual representation of an uploaded file, showing its preview (image, PDF, video, or generic file icon),
/// metadata (name, size, type), status indicators, and interactive controls. It automatically adapts its appearance based on the file type
/// and upload status.
///
/// ## Features
///
/// - Automatic file type detection and preview rendering
/// - Support for images, videos, PDFs, and generic documents
/// - Upload status indicators (success, uploading, error)
/// - File metadata display (name, size, extension)
/// - Remove action with confirmation
/// - Tap to view full file in system viewer
/// - Custom progress content support
///
/// ## Basic Usage
///
/// ```swift
/// let file = FileUpload(
///     id: "unique-id",
///     name: "document.pdf",
///     source: .files,
///     result: .success(.init(
///         url: fileURL,
///         fileExtension: "pdf",
///         size: 1024000
///     ))
/// )
///
/// SparkFileUploadPreview(
///     file: file,
///     removeAction: {
///         files.removeAll { $0.id == file.id }
///     }
/// )
/// .sparkTheme(theme)
/// ```
///
/// ## Rendering
///
/// ![Component rendering.](fileupload_preview.png)
///
public struct SparkFileUploadPreview<ProgressContent>: View where ProgressContent: View {

    // MARK: - Properties

    private let file: FileUpload

    private var progressContent: () -> ProgressContent
    private var removeAction: () -> Void

    @Environment(\.theme) private var theme

    @State private var isPressed = false
    @State private var showViewer = false
    @State private var showDeleteAlert = false

    @State private var removeFeedbackID: UUID = UUID()

    // MARK: - Initialization

    /// Creates a preview for a file upload without custom progress content.
    ///
    /// Use this initializer for the standard preview with built-in progress indicators.
    ///
    /// - Parameters:
    ///   - file: The `FileUpload` object containing file metadata and upload result.
    ///   - removeAction: A closure called when the user taps the remove button.
    ///
    /// ## Example
    ///
    /// ```swift
    /// SparkFileUploadPreview(
    ///     file: uploadedFile,
    ///     removeAction: {
    ///         files.removeAll { $0.id == uploadedFile.id }
    ///     }
    /// )
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_preview.png)
    ///
    public init(
        file: FileUpload,
        removeAction: @escaping @MainActor () -> Void
    ) where ProgressContent == EmptyView {
        self.init(
            file: file,
            progressContent: { EmptyView() },
            removeAction: removeAction
        )
    }

    /// Creates a preview for a file upload with custom progress content.
    ///
    /// Use this initializer when you need to display custom progress indicators or status views.
    ///
    /// - Parameters:
    ///   - file: The `FileUpload` object containing file metadata and upload result.
    ///   - progressContent: A view builder that creates custom progress content displayed during upload.
    ///   - removeAction: A closure called when the user taps the remove button.
    ///
    /// ## Example
    ///
    /// ```swift
    /// SparkFileUploadPreview(
    ///     file: uploadedFile,
    ///     progressContent: {
    ///         ProgressView(value: uploadProgress)
    ///             .progressViewStyle(.linear)
    ///     },
    ///     removeAction: {
    ///         files.removeAll { $0.id == uploadedFile.id }
    ///     }
    /// )
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_preview.png)
    ///
    public init(
        file: FileUpload,
        progressContent: @escaping () -> ProgressContent,
        removeAction: @escaping @MainActor () -> Void
    ) {
        self.file = file
        self.progressContent = progressContent
        self.removeAction = removeAction
    }

    // MARK: - View

    public var body: some View {
        Button {
            DispatchQueue.main.asyncAfter(deadline: .now() + FileUploadPreviewConstants.animationDuration, execute: {
                if case .success = self.file.result {
                    self.showViewer = true
                }
            })
        } label: {
            let spacing = self.theme.fileUpload.preview.layout.spacing
            let isSucceed = self.file.isSucceed
            let content = FileUploadPreviewContent(file: self.file)

            SparkHStack(spacing: spacing) {
                // Icon with background
                ZStack {
                    Rectangle()
                        .fileUploadPreviewImageBackground(isSucceed: isSucceed)

                    FileUploadPreviewImage(file: self.file).swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .fileUploadPreviewImage(isSucceed: isSucceed)
                }

                // Vertical stack for labels and progress
                SparkVStack(alignment: .leading, spacing: spacing) {

                    // Vertical stack for name and error
                    SparkVStack(alignment: .leading, spacing: .zero) {

                        // Horizontal stack for name and size
                        SparkHStack(spacing: spacing) {
                            Text(self.file.name)
                                .fileUploadPreviewName()
                                .lineLimit(1)
                                .truncationMode(.middle)

                            Spacer()

                            // File size message
                            if let fileSize = content.fileSize {
                                Text(fileSize)
                                    .fileUploadPreviewSize()
                            }
                        }

                        // Error message
                        if let error = content.error {
                            Text(error)
                                .fileUploadPreviewError()
                        }
                    }

                    // Progress
                    self.progressContent()
                }

                // Remove button
                SparkButton(
                    Image(spark: \.cross),
                    role: .destructive,
                    action: {
                        self.showDeleteAlert = true
                    }
                )
                .accessibilityLabel(String.previewRemoveButtonAccessibilityLabel(fileName: self.file.name))
                .sparkButtonIntent(FileUploadPreviewConstants.Button.intent)
                .sparkButtonVariant(FileUploadPreviewConstants.Button.variant)
                .sparkButtonSize(FileUploadPreviewConstants.Button.size)
            }
            .fileUploadPreviewContainer(isSucceed: isSucceed, isPressed: self.isPressed)
        }
        .buttonStyle(PressedButtonStyle(
            isPressed: Binding(get: {
                self.isPressed
            }, set: { value in
                self.isPressed = self.file.isSucceed ? value : false
            })
        ))
        .sparkSensoryFeedback(.success, trigger: self.removeFeedbackID)
        .accessibilityIdentifier(FileUploadPreviewAccessibilityIdentifier.view)
        .accessibilityAddTraits(.isButton, condition: self.file.isSucceed)
        .accessibilityHint(file: self.file)
        .fullScreenCover(isPresented: self.$showViewer) {
            if case .success(let details) = self.file.result {
                FileUploadPreviewFileViewer(
                    filename: self.file.name,
                    fileDetails: details,
                    isPresented: self.$showViewer
                )
            }
        }
        .alert(
            String.previewAlertTitle,
            isPresented: self.$showDeleteAlert,
            actions: {
                Button(String.previewAlertCancel, role: .cancel) {}
                Button(String.previewAlertDelete, role: .destructive) {
                    self.removeAction()
                    self.removeFeedbackID = .init()
                }
            },
            message: {
                Text(String.previewAlertMessage(fileName: self.file.name))
            }
        )
        .sparkVisualIdentification()
    }
}

// MARK: - Extension

private extension View {

    func accessibilityHint(file: FileUpload) -> some View {
        if #available(iOS 18.0, *) {
            self.accessibilityHint(
                String.previewViewButtonAccessibilityHint,
                isEnabled: file.isSucceed
            )
        } else {
            self.accessibilityHint(String.previewViewButtonAccessibilityHint)
        }
    }
}
