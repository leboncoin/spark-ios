//
//  SparkFileUploadButton.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkComponentButton
import SparkResources
@_spi(SI_SPI) import SparkCommon
import PhotosUI

/// A button that allows users to upload files from various sources.
///
/// `SparkFileUploadButton` provides a unified interface for file selection from multiple sources:
/// - Photo library (using PhotosPicker)
/// - Files app (using FileImporter)
/// - Camera (using UIImagePickerController)
///
/// The button automatically adapts its interface based on the configured file types:
/// - Shows a simple button when only one source is available
/// - Shows a menu when multiple sources are available
///
/// ## Example Usage
///
/// ### Basic usage with title and image
/// ```swift
/// @State private var uploadedFiles: [FileUpload] = []
///
/// SparkFileUploadButton(
///     "Upload Photo",
///     image: Image(systemName: "photo"),
///     files: $uploadedFiles
/// )
/// ```
///
/// ### Custom photo types and selection behavior
/// ```swift
/// @State private var uploadedFiles: [FileUpload] = []
///
/// SparkFileUploadButton(
///     "Select Images",
///     files: $uploadedFiles,
///     photoTypes: [.images],
///     photoSelectionBehavior: .continuous,
///     photoMaxSelectionCount: 5
/// )
/// ```
///
/// ### Custom file types with multiple selection
/// ```swift
/// @State private var uploadedFiles: [FileUpload] = []
///
/// SparkFileUploadButton(
///     "Upload Documents",
///     files: $uploadedFiles,
///     fileTypes: [.pdf, .plainText],
///     fileAllowsMultipleSelection: true
/// )
/// ```
///
/// ### Custom label with ViewBuilder
/// ```swift
/// @State private var uploadedFiles: [FileUpload] = []
///
/// SparkFileUploadButton(
///     files: $uploadedFiles
/// ) {
///     HStack {
///         Image(systemName: "arrow.up.doc")
///         Text("Custom Upload")
///     }
/// }
/// ```
///
/// - Note: Ensure appropriate permissions are configured in Info.plist:
///   - `NSPhotoLibraryUsageDescription` for photo library access
///   - `NSCameraUsageDescription` for camera access
///   - `NSDocumentsFolderUsageDescription` for file access (if needed)
///
/// ## Rendering
///
/// ![Component rendering.](fileupload_button.png)
/// 
public struct SparkFileUploadButton<Label>: View where Label: View {

    // MARK: - Properties

    private var label: () -> Label

    private let title: String?
    private let image: Image?

    private let photoTypes: [PHPickerFilter]
    private let photoSelectionBehavior: FileUploadPhotoSelectionBehavior
    private let photoMaxSelectionCount: Int?

    private let fileTypes: [UTType]
    private let fileAllowsMultipleSelection: Bool

    @Binding private var files: [FileUpload]

    @State private var photoSelection = [PhotosPickerItem]()

    @State private var showPhotos = false
    @State private var showFiles = false
    @State private var showCamera = false

    @StateObject private var viewModel = FileUploadButtonViewModel()
    @StateObject private var services = FileUploadButtonServices()

    // MARK: - Initialization

    init(
        title: String?,
        image: Image? = nil,
        files: Binding<[FileUpload]>,
        photoTypes: [PHPickerFilter],
        photoSelectionBehavior: FileUploadPhotoSelectionBehavior,
        photoMaxSelectionCount: Int?,
        fileTypes: [UTType],
        fileAllowsMultipleSelection: Bool,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.title = title
        self.image = image
        self._files = files
        self.photoTypes = photoTypes
        self.photoSelectionBehavior = photoSelectionBehavior
        self.photoMaxSelectionCount = photoMaxSelectionCount
        self.fileTypes = fileTypes
        self.fileAllowsMultipleSelection = fileAllowsMultipleSelection
        self.label = label
    }

    // MARK: - View

    public var body: some View {
        ZStack {
            self.button()
                .sparkButtonStyle(.fileUpload)
                .onChange(of: self.files) { files in
                    // Remove the selected photo in the picker if
                    // they not exists anymore in the Spark object
                    self.services.clearPhotosSelection.execute(
                        &self.photoSelection,
                        files: files
                    )
                }
        }
        .photosPicker(
            isPresented: self.$showPhotos,
            selection: self.$photoSelection,
            maxSelectionCount: self.photoMaxSelectionCount,
            selectionBehavior: self.photoSelectionBehavior.pickerSelectionBehavior,
            matching: self.photoTypes.isEmpty ? nil : .any(of: self.photoTypes),
            photoLibrary: .shared()
        )
        .fileImporter(
            isPresented: self.$showFiles,
            allowedContentTypes: self.fileTypes,
            allowsMultipleSelection: self.fileAllowsMultipleSelection
        ) { result in
            let newFiles = self.services.fetchFiles.execute(
                from: result,
                files: self.files
            )
            self.files.appendIfUnique(newFiles)
        }
        .fullScreenCover(isPresented: self.$showCamera) {
            FileUploadCameraPicker(isPresented: self.$showCamera) { image in
                let newFile = self.services.fetchCameraImage.execute(image)
                self.files.appendIfUnique(newFile)
            }
            .ignoresSafeArea()
        }
        .task(id: self.photoSelection) {
            // Clear from current selection
            self.services.clearFiles.execute(
                &self.files,
                photoSelection: self.photoSelection
            )

            // Fetch selection
            if await PHPhotoLibrary.requestAuthorization(for: .readWrite) == .authorized {
                let newFiles = await self.services.fetchPhotos.execute(
                    from: self.photoSelection,
                    files: self.files
                )

                self.files.appendIfUnique(newFiles)
            }
        }
        .onAppear() {
            self.viewModel.setup(
                photoTypes: self.photoTypes,
                fileTypes: self.fileTypes
            )
        }
        .onChange(of: self.photoTypes) { photoTypes in
            self.viewModel.photoTypes = photoTypes
        }
        .onChange(of: self.fileTypes) { fileTypes in
            self.viewModel.fileTypes = fileTypes
        }
    }

    @ViewBuilder
    private func button() -> some View {
        switch self.viewModel.contentType {

        case .photos:
            self.photosButton()

        case .files:
            self.button(action: {
                self.showFiles = true
            })

        case .all:
            self.menu()

        default:
            EmptyView()
        }
    }

    @ViewBuilder
    private func photosButton() -> some View {
        // Photos + Camera -> Menu
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.menu()

        } else { // Photos only -> Button
            self.button(action: {
                self.showPhotos = true
            })
        }
    }

    @ViewBuilder
    private func button(action: @escaping @MainActor () -> Void) -> some View {
        if !self.label().isEmptyView { // Custom content ?
            Button(action: action, label: self.label)

        } else if let title, let image { // Title & Image
            SparkButton(title, image: image, action: action)

        } else if let title { // Title only
            SparkButton(title, action: action)

        } else if let image { // Image only
            SparkButton(image, action: action)

        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func menu() -> some View {
        if !self.label().isEmptyView { // Custom content ?
            Menu(
                content: self.menuContent,
                label: self.label
            )

        } else if let title, let image { // Title & Image
            SparkButton(
                title,
                image: image,
                content: self.menuContent
            )

        } else if let title { // Title only
            SparkButton(
                title,
                content: self.menuContent
            )

        } else if let image { // Image only
            SparkButton(
                image,
                content: self.menuContent
            )

        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func menuContent() -> some View {
        // Photos
        if self.viewModel.contentType.showPhotos {

            // Camera
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                Button(.buttonFromCamera, image: Image(spark: \.cameraOutline)) {
                    self.showCamera = true
                }
                .tint(.primary)
            }

            Button(.buttonFromPhotosApp, image: Image(spark: \.imageOutline)) {
                self.showPhotos = true
            }
            .tint(.primary)
        }

        // Files
        if self.viewModel.contentType.showFiles {
            Button(.buttonFromFilesApp, image: Image(spark: \.fileOutline)) {
                self.showFiles = true
            }
            .tint(.primary)
        }
    }
}

// MARK: - Extension

private extension Button {

    init(
        _ title: String,
        image: Image,
        action: @escaping @MainActor () -> Void
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(action: action, label: {
            SwiftUI.Label {
                Text(title)
            } icon: {
                image
            }
        })
    }
}
