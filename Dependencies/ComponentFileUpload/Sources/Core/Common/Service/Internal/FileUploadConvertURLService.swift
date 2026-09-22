//
//  FileUploadConvertURLService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

protocol FileUploadConvertURLServicing {
    func execute<Convertible>(from url: URL) throws -> Convertible where Convertible: FileUploadConvertible
}

struct FileUploadConvertURLService: FileUploadConvertURLServicing {

    // MARK: - Methods

    func execute<Convertible>(from url: URL) throws -> Convertible where Convertible: FileUploadConvertible {
        // Request access to security-scoped resource for files from iCloud, document pickers, etc.
        let accessGranted = url.startAccessingSecurityScopedResource()
        defer {
            if accessGranted {
                url.stopAccessingSecurityScopedResource()
            }
        }

        // Get the filename
        let filename = url.lastPathComponent
        let fileExtension = url.pathExtension

        // Get the size of the file
        let data = try Data(contentsOf: url)
        let size = Measurement(
            value: Double(data.count),
            unit: UnitInformationStorage.bytes
        )

        // **
        // Copy the file in the temporary folder
        let temporaryURL: URL = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
        if FileManager.default.fileExists(atPath: temporaryURL.path) {
            try FileManager.default.removeItem(at: temporaryURL)
        }

        try FileManager.default.copyItem(at: url, to: temporaryURL)
        // **

        return .init(
            name: filename,
            fileExtension: fileExtension,
            size: size.value,
            url: temporaryURL,
            data: data
        )
    }
}
