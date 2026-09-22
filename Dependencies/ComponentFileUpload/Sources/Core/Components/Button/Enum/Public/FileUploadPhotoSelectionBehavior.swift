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

import Foundation

/// A value that determines how the Spark File upload Photos picker handles user selection.
public enum FileUploadPhotoSelectionBehavior: CaseIterable {
    /// Uses the default selection behavior.
    case `default`
    /// Uses the selection order made by the user. Selected items are numbered.
    case ordered
    /// Selection can be delivered continuously.
    case continuous
    /// Selection can be delivered continuously and uses the selection order made by the user. Selected assets are numbered.
    case continuousAndOrdered

    // MARK: - Properties

    var pickerSelectionBehavior: PhotosPickerSelectionBehavior {
        return switch self {
        case .default: .default
        case .ordered: .ordered
        case .continuous:
            if #available(iOS 17.0, *) {
                .continuous
            } else {
                .default
            }
        case .continuousAndOrdered:
            if #available(iOS 17.0, *) {
                .continuousAndOrdered
            } else {
                .ordered
            }
        }
    }
}
