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

    @StateObject private var viewModel = FileUploadPreviewViewModel()
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
            SparkHStack(spacing: self.viewModel.layout.spacing) {
                // Icon with background
                ZStack {
                    Rectangle()
                        .fill(self.viewModel.colors.imageBackgroundColorToken)
                        .frame(size: FileUploadPreviewConstants.Image.containerSize)
                        .sparkCornerRadius(self.viewModel.border.imageRadius)

                    self.viewModel.image.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(size: FileUploadPreviewConstants.Image.size, alignment: .center)
                        .foregroundStyle(self.viewModel.colors.imageTintColorToken)
                }

                // Vertical stack for labels and progress
                SparkVStack(alignment: .leading, spacing: self.viewModel.layout.spacing) {

                    // Vertical stack for name and error
                    SparkVStack(alignment: .leading, spacing: .zero) {

                        // Horizontal stack for name and size
                        SparkHStack(spacing: self.viewModel.layout.spacing) {
                            Text(self.file.name)
                                .font(self.viewModel.fonts.nameFontToken)
                                .foregroundStyle(self.viewModel.colors.nameTextColorToken)
                                .lineLimit(1)
                                .truncationMode(.middle)

                            Spacer()

                            // File size message
                            if let fileSize = self.viewModel.content.fileSize {
                                Text(fileSize)
                                    .font(self.viewModel.fonts.sizeFontToken)
                                    .foregroundStyle(self.viewModel.colors.sizeTextColorToken)
                            }
                        }

                        // Error message
                        if let error = self.viewModel.content.error {
                            Text(error)
                                .font(self.viewModel.fonts.errorFontToken)
                                .foregroundStyle(self.viewModel.colors.errorTextColorToken)
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
            .sparkPadding(.horizontal, self.viewModel.layout.horizontalPadding)
            .sparkPadding(.vertical, self.viewModel.layout.verticalPadding)
            .background(self.viewModel.colors.backgroundColorToken.color)
            .sparkBorder(
                width: self.viewModel.border.width,
                radius: self.viewModel.border.radius,
                colorToken: self.viewModel.colors.borderColorToken,
                position: .inner
            )
            .scaleEffect(self.viewModel.isPressed ? FileUploadPreviewConstants.pressedScaled : 1.0)
            .optionalAnimation(
                .easeInOut(duration: FileUploadPreviewConstants.animationDuration),
                value: self.viewModel.isPressed
            )
        }
        .buttonStyle(PressedButtonStyle(
            isPressed: Binding(get: {
                self.viewModel.isPressed
            }, set: { value in
                self.viewModel.isPressed = self.file.isSucceed ? value : false
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
                Text(String.previewAlertMessage(fileName: file.name))
            }
        )
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                file: self.file
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.file) { file in
            self.viewModel.file = file
        }
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
