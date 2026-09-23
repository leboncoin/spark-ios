//
//  SparkFileUploadDropzone+InitExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import UniformTypeIdentifiers
import SparkComponentButton

public extension SparkFileUploadDropzone {

    // MARK: - Without Description & Additional

    /// Creates a minimal dropzone to upload files with only an upload button.
    ///
    /// Use this initializer for the simplest dropzone with no labels.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - files: A binding to an array of ``FileUpload` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - uploadButton: A view builder that creates the upload button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkFileUploadDropzone(
    ///     files: self.$files,
    ///     uploadButton: {
    ///         SparkFileUploadButton(
    ///             "Upload",
    ///             files: self.$files
    ///         )
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    ///
    init(
        icon: Image? = nil,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = .sparkDefaults,
        @ViewBuilder uploadButton: @escaping () -> UploadButton
    ) where DescriptionLabel == EmptyView, AdditionalLabel == EmptyView {
        self.init(
            icon: icon,
            files: files,
            fileTypes: fileTypes,
            descriptionLabel: { EmptyView() },
            uploadButton: uploadButton,
            additionalLabel: { EmptyView() }
        )
    }

    // MARK: - Description Only

    /// Creates a dropzone to upload files with description text and a ``SparkFileUploadButton`` button, without additional text.
    ///
    /// Use this initializer when you don't need additional information text.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - descriptionText: The main description text to display.
    ///   - files: A binding to an array of ``FileUpload` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - uploadButton: A view builder that creates the upload button.
    ///   Use the ``SparkFileUploadButton`` to implement the button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkFileUploadDropzone(
    ///     icon: Image(systemName: "arrow.up.doc"),
    ///     descriptionText: "Drag and drop a file or",
    ///     files: self.$files,
    ///     uploadButton: {
    ///         SparkFileUploadButton(
    ///             "Browse my files",
    ///             files: self.$files
    ///         )
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    ///
    init(
        icon: Image? = nil,
        descriptionText: String,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = .sparkDefaults,
        @ViewBuilder uploadButton: @escaping () -> UploadButton
    ) where DescriptionLabel == Text, AdditionalLabel == EmptyView {
        self.init(
            icon: icon,
            files: files,
            fileTypes: fileTypes,
            descriptionLabel: { Text(descriptionText) },
            uploadButton: uploadButton,
            additionalLabel: { EmptyView() }
        )
    }

    /// Creates a dropzone to upload files with only a custom description and upload button.
    ///
    /// Use this initializer when you need custom description without additional text.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - files: A binding to an array of ``FileUpload` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - descriptionLabel: A view builder that creates the custom description label.
    ///   - uploadButton: A view builder that creates the upload button.
    ///
    /// ## Example of usage
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
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    ///
    init(
        icon: Image? = nil,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = .sparkDefaults,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel,
        @ViewBuilder uploadButton: @escaping () -> UploadButton
    ) where AdditionalLabel == EmptyView {
        self.init(
            icon: icon,
            files: files,
            fileTypes: fileTypes,
            descriptionLabel: descriptionLabel,
            uploadButton: uploadButton,
            additionalLabel: { EmptyView() }
        )
    }

    // MARK: - Additional Only

    /// Creates a dropzone to upload files without a description label.
    ///
    /// Use this initializer when you only need an upload button and optional additional text.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - additionalText: The additional information text to display below the button.
    ///   - files: A binding to an array of ``FileUpload` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - uploadButton: A view builder that creates the upload button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkFileUploadDropzone(
    ///     icon: Image(systemName: "arrow.up.doc"),
    ///     additionalText: ".png, .jpg up to 5MB",
    ///     files: self.$files,
    ///     uploadButton: {
    ///         SparkFileUploadButton(
    ///             "Upload Files",
    ///             files: self.$files
    ///         )
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    ///
    init(
        icon: Image? = nil,
        additionalText: String,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = .sparkDefaults,
        @ViewBuilder uploadButton: @escaping () -> UploadButton
    ) where DescriptionLabel == EmptyView, AdditionalLabel == Text {
        self.init(
            icon: icon,
            files: files,
            fileTypes: fileTypes,
            descriptionLabel: { EmptyView() },
            uploadButton: uploadButton,
            additionalLabel: { Text(additionalText) }
        )
    }

    /// Creates a dropzone to upload files with only a custom additional label and upload button.
    ///
    /// Use this initializer when you only need an upload button and custom additional text without description.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - files: A binding to an array of ``FileUpload`` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - uploadButton: A view builder that creates the upload button.
    ///   - additionalLabel: A view builder that creates the custom additional label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkFileUploadDropzone(
    ///     icon: Image(systemName: "arrow.up.doc"),
    ///     files: self.$files,
    ///     uploadButton: {
    ///         SparkButton("Upload Files", action: {})
    ///     },
    ///     additionalLabel: {
    ///         HStack {
    ///             Image(systemName: "info.circle")
    ///             Text("Max 5MB")
    ///         }
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    ///
    init(
        icon: Image? = nil,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = .sparkDefaults,
        @ViewBuilder uploadButton: @escaping () -> UploadButton,
        @ViewBuilder additionalLabel: @escaping () -> AdditionalLabel
    ) where DescriptionLabel == EmptyView {
        self.init(
            icon: icon,
            files: files,
            fileTypes: fileTypes,
            descriptionLabel: { EmptyView() },
            uploadButton: uploadButton,
            additionalLabel: additionalLabel
        )
    }

    // MARK: - All

    /// Creates a dropzone to upload files with text labels and a ``SparkFileUploadButton`` button.
    ///
    /// Use this initializer when you want a simple dropzone with text descriptions.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display at the top of the dropzone. Optional. Default is *nil*.
    ///   - descriptionText: The main description text to display.
    ///   - additionalText: The additional information text to display below the button.
    ///   - files: A binding to an array of ``FileUpload`` objects.
    ///   - fileTypes: The supported file types for drag and drop. Optional. Default is *.sparkDefaults*.
    ///   - uploadButton: A view builder that creates the upload button.
    ///   Use the ``SparkFileUploadButton`` to implement the button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkFileUploadDropzone(
    ///     icon: Image(systemName: "arrow.up.doc"),
    ///     descriptionText: "Drag and drop a file or",
    ///     additionalText: ".png, .jpg up to 5MB",
    ///     files: self.$files,
    ///     uploadButton: {
    ///         SparkFileUploadButton(
    ///             "Browse my files",
    ///             files: self.$files
    ///         )
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](fileupload_dropzone_default.png)
    /// 
    init(
        icon: Image? = nil,
        descriptionText: String,
        additionalText: String,
        files: Binding<[FileUpload]>,
        fileTypes: [UTType] = .sparkDefaults,
        @ViewBuilder uploadButton: @escaping () -> UploadButton
    ) where DescriptionLabel == Text, AdditionalLabel == Text {
        self.init(
            icon: icon,
            files: files,
            fileTypes: fileTypes,
            descriptionLabel: { Text(descriptionText) },
            uploadButton: uploadButton,
            additionalLabel: { Text(additionalText) }
        )
    }
}
