//
//  FileUploadPhotoSelectionBehavior.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import PhotosUI
import SwiftUI

/// The selection behavior of the photos picker opened by the ``SparkFileUploadButton``.
///
/// It is mapped to the native `PhotosPickerSelectionBehavior`.
///
/// ## Example
///
/// ```swift
/// @State private var uploadedFiles: [FileUpload] = []
///
/// SparkFileUploadButton(
///     "Upload Photos",
///     files: $uploadedFiles,
///     photoTypes: [.images],
///     photoSelectionBehavior: .ordered
/// )
/// ```
public enum FileUploadPhotoSelectionBehavior: CaseIterable {

    // MARK: - Cases

    /// Uses the default selection behavior.
    case `default`

    /// Uses the selection order made by the user. Selected items are numbered.
    case ordered

    /// Selection can be delivered continuously.
    case continuous

    /// Selection can be delivered continuously and uses the selection order made by the user.
    /// Selected assets are numbered.
    case continuousAndOrdered

    // MARK: - Properties

    /// The equivalent native `PhotosPickerSelectionBehavior`.
    var pickerSelectionBehavior: PhotosPickerSelectionBehavior {
        return switch self {
        case .default: .default
        case .ordered: .ordered
        case .continuous: .continuous
        case .continuousAndOrdered: .continuousAndOrdered
        }
    }
}
