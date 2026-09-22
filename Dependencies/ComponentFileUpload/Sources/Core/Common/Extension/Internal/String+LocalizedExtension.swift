//
//  String+LocalizedExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 01/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    // MARK: Button

    static let buttonFromPhotosApp = String(localized: "button_from_photos_app", bundle: .current)
    static let buttonFromFilesApp = String(localized: "button_from_files_app", bundle: .current)
    static let buttonFromCamera = String(localized: "button_from_camera", bundle: .current)

    // MARK: Preview

    static let previewAlertTitle = String(localized: "preview_alert_title", bundle: .current)
    static let previewAlertCancel = String(localized: "preview_alert_cancel", bundle: .current)
    static let previewAlertDelete = String(localized: "preview_alert_delete", bundle: .current)

    // MARK: Error

    static let errorPhotoResourceNotFound = String(localized: "error_photo_resource_not_found", bundle: .current)
    static let errorPhotoTransfer = String(localized: "error_photo_transfer", bundle: .current)
    static let errorFileSizeNotFound = String(localized: "error_file_size_not_found", bundle: .current)
    static let errorFileDataConversion = String(localized: "error_file_data_conversion", bundle: .current)
    static let errorDropConversion = String(localized: "error_drop_conversion", bundle: .current)

    // MARK: - Preview Methods

    static func previewAlertMessage(fileName: String) -> String {
        let stringKey = String(localized: "preview_alert_message", bundle: .current)
        return String(format: stringKey, fileName)
    }

    static func previewRemoveButtonAccessibilityLabel(fileName: String) -> String {
        let stringKey = String(localized: "preview_remove_button_accessibility_label", bundle: .current)
        return String(format: stringKey, fileName)
    }

    static var previewViewButtonAccessibilityHint: String {
        String(localized: "preview_view_button_accessibility_hint", bundle: .current)
    }
}
