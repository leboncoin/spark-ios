//
//  SparkFileUploadButton+InitExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import PhotosUI

public extension SparkFileUploadButton where Label == EmptyView {

    /// Creates a file upload button with a title and optional image.
    ///
    /// This initializer creates a button with standard Spark styling that can access
    /// photos, files, and camera based on the configured types.
    ///
    /// ## Example
    /// ```swift
    /// @State private var uploadedFiles: [FileUpload] = []
    ///
    /// SparkFileUploadButton(
    ///     "Upload File",
    ///     image: Image(systemName: "arrow.up.doc"),
    ///     files: $uploadedFiles,
    ///     photoTypes: [.images, .videos],
    ///     photoMaxSelectionCount: 3,
    ///     fileTypes: [.pdf, .png],
    ///     fileAllowsMultipleSelection: true
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The text to display on the button.
    ///   - image: An optional image to display alongside the title. Default is `nil`.
    ///   - files: A binding to an array of uploaded files.
    ///   - photoTypes: The types of photos that can be selected. Default is `.sparkDefaults`.
    ///   - photoSelectionBehavior: The selection behavior of the Photos picker. Default is `.default`.
    ///   - photoMaxSelectionCount: The maximum number of items that can be selected. Default is `nil`. Setting it to `nil` means maximum supported by the system.
    ///   - fileTypes: The file types that can be selected from the Files app. Default is `.sparkDefaults`.
    ///   - fileAllowsMultipleSelection: Whether multiple files can be selected from the Files app. Default is `false`.
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_button.png)
    ///
    init(
        _ title: String,
        image: Image? = nil,
        files: Binding<[FileUpload]>,
        photoTypes: [PHPickerFilter] = .sparkDefaults,
        photoSelectionBehavior: FileUploadPhotoSelectionBehavior = .default,
        photoMaxSelectionCount: Int? = nil,
        fileTypes: [UTType] = .sparkDefaults,
        fileAllowsMultipleSelection: Bool = false
    ) {
        self.init(
            title: title,
            image: image,
            files: files,
            photoTypes: photoTypes,
            photoSelectionBehavior: photoSelectionBehavior,
            photoMaxSelectionCount: photoMaxSelectionCount,
            fileTypes: fileTypes,
            fileAllowsMultipleSelection: fileAllowsMultipleSelection,
            label: { EmptyView() }
        )
    }

    /// Creates a file upload button with an image only (no title).
    ///
    /// This initializer creates an icon-only button, useful for compact layouts
    /// or when the button's purpose is clear from context.
    ///
    /// ## Example
    /// ```swift
    /// @State private var uploadedFiles: [FileUpload] = []
    ///
    /// SparkFileUploadButton(
    ///     Image(systemName: "photo.badge.plus"),
    ///     files: $uploadedFiles,
    ///     photoTypes: [.images],
    ///     photoMaxSelectionCount: 1
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - image: The image to display on the button.
    ///   - files: A binding to an array of uploaded files.
    ///   - photoTypes: The types of photos that can be selected. Default is `.sparkDefaults`.
    ///   - photoSelectionBehavior: The selection behavior of the Photos picker. Default is `.default`.
    ///   - photoMaxSelectionCount: The maximum number of items that can be selected. Default is `nil`.
    ///   - fileTypes: The file types that can be selected from the Files app. Default is `.sparkDefaults`.
    ///   - fileAllowsMultipleSelection: Whether multiple files can be selected from the Files app. Default is `false`.
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_button.png)
    ///
    init(
        _ image: Image,
        files: Binding<[FileUpload]>,
        photoTypes: [PHPickerFilter] = .sparkDefaults,
        photoSelectionBehavior: FileUploadPhotoSelectionBehavior = .default,
        photoMaxSelectionCount: Int? = nil,
        fileTypes: [UTType] = .sparkDefaults,
        fileAllowsMultipleSelection: Bool = false
    ) {
        self.init(
            title: nil,
            image: image,
            files: files,
            photoTypes: photoTypes,
            photoSelectionBehavior: photoSelectionBehavior,
            photoMaxSelectionCount: photoMaxSelectionCount,
            fileTypes: fileTypes,
            fileAllowsMultipleSelection: fileAllowsMultipleSelection,
            label: { EmptyView() }
        )
    }
}

public extension SparkFileUploadButton {

    /// Creates a file upload button with a custom label.
    ///
    /// This initializer allows you to provide a completely custom SwiftUI view
    /// as the button's label, giving you full control over the button's appearance.
    ///
    /// ## Example
    /// ```swift
    /// @State private var uploadedFiles: [FileUpload] = []
    ///
    /// SparkFileUploadButton(
    ///     files: $uploadedFiles,
    ///     photoTypes: [.images],
    ///     fileTypes: [.pdf]
    /// ) {
    ///     VStack {
    ///         Image(systemName: "cloud.upload")
    ///             .font(.largeTitle)
    ///         Text("Upload Files")
    ///             .font(.headline)
    ///     }
    ///     .padding()
    ///     .background(Color.blue.opacity(0.1))
    ///     .cornerRadius(8)
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - files: A binding to an array of uploaded files.
    ///   - photoTypes: The types of photos that can be selected. Default is `.sparkDefaults`.
    ///   - photoSelectionBehavior: The selection behavior of the Photos picker. Default is `.default`.
    ///   - photoMaxSelectionCount: The maximum number of items that can be selected. Default is `nil`.
    ///   - fileTypes: The file types that can be selected from the Files app. Default is `.sparkDefaults`.
    ///   - fileAllowsMultipleSelection: Whether multiple files can be selected from the Files app. Default is `false`.
    ///   - label: A view builder that creates the custom label for the button.
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_button.png)
    ///  
    init(
        files: Binding<[FileUpload]>,
        photoTypes: [PHPickerFilter] = .sparkDefaults,
        photoSelectionBehavior: FileUploadPhotoSelectionBehavior = .default,
        photoMaxSelectionCount: Int? = nil,
        fileTypes: [UTType] = .sparkDefaults,
        fileAllowsMultipleSelection: Bool = false,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(
            title: nil,
            image: nil,
            files: files,
            photoTypes: photoTypes,
            photoSelectionBehavior: photoSelectionBehavior,
            photoMaxSelectionCount: photoMaxSelectionCount,
            fileTypes: fileTypes,
            fileAllowsMultipleSelection: fileAllowsMultipleSelection,
            label: label
        )
    }
}
