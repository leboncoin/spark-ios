# SparkComponentFileUpload

The Spark FileUpload Allows the user to upload a file (image, document, etc.) from their device.


A component that allows users to select, upload, and preview files (images, PDFs, etc.) from their device. 
We recommend using it in forms, messaging, or user profiles (e.g., profile picture).

## Overview

The component is available only on **SwiftUI** and requires at least **iOS 16**.

This repository contains four sub components : 
- ``SparkFileUploadButton``
- ``SparkFileUploadDropzone``
- ``SparkFileUploadPreview``
- ``SparkFileUploadPreviewGroup``

### Permissions

**Note**: Ensure appropriate permissions are configured in Info.plist:
- `NSPhotoLibraryUsageDescription` for photo library access
- `NSCameraUsageDescription` for camera access
- `NSDocumentsFolderUsageDescription` for file access (if needed)

## Implementation

### Button

The ``SparkFileUploadButton`` component provides an interactive control that allows users to select files from their device. It supports multiple selection methods including photo library, file browser, and camera capture.

#### Features

- **Multiple Sources**: Access photos, files, or camera
- **Batch Selection**: Select multiple files at once
- **Photo Selection Behavior**: Control whether selections replace or append to existing files
- **File Type Filtering**: Restrict accepted file types using `PHPickerFilter` and `UTType`
- **Customizable Styling**: Built-in `.fileUpload` button style

#### Implementation

Use the ``SparkFileUploadButton`` view in SwiftUI. The component requires a binding to an array of `FileUpload` objects.

#### Properties

- **title**: Button text label
- **image**: Optional icon displayed in the button
- **files**: Binding to array of `FileUpload` objects
- **photoSelectionBehavior**: How new selections interact with existing files (`.replace` or `.append`)
- **photoFilter**: Filter for photo library (`.images`, `.videos`, or `.any`)
- **fileTypes**: Array of `UTType` for file picker
- **showCamera**: Whether to show camera option (requires camera permission)

#### Button Style

Apply the FileUpload style to any `SparkButton`:

```swift
SparkButton("Upload", image: .sparkExport) {
    // Action
}
.sparkButtonStyle(.fileUpload)
```

#### Accessibility

The button inherits standard button accessibility features. Set a descriptive label for screen readers:

```swift
SparkFileUploadButton(
    "Upload Files",
    files: $files
)
.accessibilityLabel("Upload files button")
```

#### Rendering

![Component rendering.](fileupload_button.png)

### Dropzone

The ``SparkFileUploadDropzone`` component provides a designated area where users can drag and drop files or click to browse and select files from their device. It offers a clear, intuitive interface for file uploads with visual feedback.

#### Features

- **Drag & Drop**: Users can drag files from their desktop/file manager and drop them into the dropzone
- **Click to Browse**: Alternative method to select files via system file picker
- **Visual Feedback**: Border highlights when files are being dragged over the dropzone
- **Flexible Content**: Supports customizable labels and icons
- **File Type Filtering**: Restricts accepted file types using `UTType`

#### Implementation

Use the ``SparkFileUploadDropzone`` view in SwiftUI. The component requires a binding to an array of `FileUpload` objects that will be populated when files are selected.

#### Properties

- **icon**: Optional image displayed at the top of the dropzone
- **descriptionText/descriptionLabel**: Primary text or custom view shown above the button
- **uploadButton**: The button view for file selection (typically `SparkFileUploadButton`)
- **additionalText/additionalLabel**: Secondary text or custom view shown below the button (e.g., file format, size limits)
- **files**: Binding to array of `FileUpload` objects
- **fileTypes**: Array of `UTType` for accepted file types (defaults to `.sparkDefaults`)

#### Accessibility

The dropzone is accessible as a container element, with all child elements (icon, labels, button) individually accessible.

To enhance accessibility:
- Provide clear, descriptive text in labels
- Include file type and size restrictions in the additional text
- The upload button should have appropriate accessibility labels

#### Rendering

![Component rendering.](fileupload_dropzone_default.png)

### Preview

The Preview component displays a visual representation of an uploaded file with metadata, status indicators, and interactive controls. It provides a consistent interface for viewing different file types including images, PDFs, videos, and documents.

#### Features

- **File Type Detection**: Automatically determines preview type based on file extension
- **Multiple Viewers**: Supports image, video, PDF, and document previews
- **Status Indicators**: Shows upload progress, success, or error states
- **Remove Action**: Built-in button to remove the file
- **Metadata Display**: Shows file name, size, and type
- **Responsive Design**: Adapts to different file types and states

#### Implementation

Use the ``SparkFileUploadPreview`` view in SwiftUI. The component requires a `FileUpload` object and a remove action closure.

##### Basic Usage

```swift
let file = FileUpload(
    id: "unique-id",
    name: "document.pdf",
    source: .files,
    result: .success(.init(
        url: fileURL,
        fileExtension: "pdf",
        size: 1024000
    ))
)

SparkFileUploadPreview(
    file: file,
    removeAction: {
        // Handle file removal
        files.removeAll { $0.id == file.id }
    }
)
.sparkTheme(theme)
```

##### With Custom Status

```swift
SparkFileUploadPreview(
    file: file,
    status: .uploading,
    removeAction: {
        // Handle removal
    }
)
```

##### Error State

```swift
let failedFile = FileUpload(
    id: "error-id",
    name: "failed.jpg",
    source: .camera,
    result: .failure(.photoResourceNotFound)
)

SparkFileUploadPreview(
    file: failedFile,
    removeAction: {
        // Handle removal
    }
)
```

#### File Types Supported

The preview automatically adapts based on file extension:

- **Images**: `.jpg`, `.jpeg`, `.png`, `.gif`, `.heic`, `.heif`, `.tiff`, etc.
- **Videos**: `.mp4`, `.mov`, `.m4v`, `.avi`, `.mkv`, etc.
- **PDFs**: `.pdf`
- **Documents**: All other file types show a generic file icon

#### Preview Types

- **Image Viewer**: Displays the actual image with metadata
- **Video Viewer**: Shows video thumbnail with play indicator
- **PDF Viewer**: Renders first page of PDF
- **File Viewer**: Generic icon for other document types

#### Status Types

- **Default**: Normal state after successful upload
- **Uploading**: Shows progress indicator
- **Error**: Displays error message from `FileUploadError`

#### Properties

- **file**: The `FileUpload` object containing file metadata and upload result
- **status**: Optional `FileUploadPreviewStatus` (`.default`, `.uploading`)
- **removeAction**: Closure called when user taps remove button

#### Accessibility

The preview component is fully accessible:

- File name is used as accessibility label
- Remove button has descriptive label
- Status indicators are announced to screen readers
- Error messages are accessible

#### Rendering

![Component rendering.](fileupload_preview.png)

### Preview Group

The Preview Group component displays a collection of file previews in an organized, responsive layout. It automatically arranges multiple `SparkFileUploadPreview` components and adapts to different screen sizes and orientations.

#### Features

- **Responsive Layout**: Automatically adjusts to available space
- **Multiple Columns**: Displays previews in a grid layout
- **Consistent Spacing**: Maintains proper spacing between previews
- **Scroll Support**: Handles large numbers of files with scrolling
- **Individual Actions**: Each preview maintains its own remove action

#### Implementation

Use the ``SparkFileUploadPreviewGroup`` view in SwiftUI. The component requires an array of `FileUpload` objects and a remove action closure.

##### Basic Usage

```swift
@State private var files: [FileUpload] = [
    // Array of FileUpload objects
]

SparkFileUploadPreviewGroup(
    files: files,
    removeAction: { file in
        files.removeAll { $0.id == file.id }
    }
)
.sparkTheme(theme)
```

##### With Upload Button

Combine with the upload button for a complete file management interface:

```swift
@State private var files: [FileUpload] = []

VStack(spacing: 16) {
    SparkFileUploadButton(
        "Add Files",
        files: $files
    )

    if !files.isEmpty {
        SparkFileUploadPreviewGroup(
            files: files,
            removeAction: { file in
                files.removeAll { $0.id == file.id }
            }
        )
    }
}
.sparkTheme(theme)
```

##### With Dropzone

Create a complete upload interface:

```swift
@State private var files: [FileUpload] = []

VStack(spacing: 24) {
    SparkFileUploadDropzone(
        icon: Image(systemName: "arrow.up.doc"),
        descriptionText: "Drag and drop files or",
        additionalText: "PNG, JPG, PDF up to 10MB",
        files: $files
    ) {
        SparkFileUploadButton(
            "Browse Files",
            files: $files
        )
    }

    if !files.isEmpty {
        SparkFileUploadPreviewGroup(
            files: files,
            removeAction: { file in
                files.removeAll { $0.id == file.id }
            }
        )
    }
}
.sparkTheme(theme)
```

##### Filter by Status

Show only successful uploads or only errors:

```swift
let successfulFiles = files.filter { $0.isSucceed }
let failedFiles = files.filter { !$0.isSucceed }

VStack {
    if !failedFiles.isEmpty {
        Text("Failed Uploads")
            .font(.headline)
        SparkFileUploadPreviewGroup(
            files: failedFiles,
            removeAction: removeFile
        )
    }

    if !successfulFiles.isEmpty {
        Text("Uploaded Files")
            .font(.headline)
        SparkFileUploadPreviewGroup(
            files: successfulFiles,
            removeAction: removeFile
        )
    }
}
```

#### Layout Behavior

The preview group automatically:
- Calculates optimal number of columns based on available width
- Maintains consistent spacing between items
- Adapts to portrait and landscape orientations
- Handles single item and multiple items efficiently

#### Properties

- **files**: Array of `FileUpload` objects to display
- **removeAction**: Closure called with the file to remove when user taps remove button on any preview

#### Accessibility

The preview group maintains accessibility for all child previews:
- Each preview is individually accessible
- Group is announced as a collection
- Remove actions are clearly labeled
- File count is announced

#### Rendering

![Component rendering.](fileupload_preview_group.png)

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/737568-fileupload)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=59809-4315)
