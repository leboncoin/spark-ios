//
//  FileUploadButtonFetchCameraImageService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadButtonFetchCameraImageService {

    // MARK: - Methods

    func execute(_ image: UIImage) -> FileUpload {
        // Generate unique identifier for the camera photo
        let id = UUID().uuidString

        // Convert UIImage to Data
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return FileUpload(
                id: id,
                source: .camera,
                error: .fileDataConversion(nil)
            )
        }

        // Create temporary URL for the image
        let fileName = "camera_\(Date().timeIntervalSince1970).jpg"
        let tempDirectory = FileManager.default.temporaryDirectory
        let fileURL = tempDirectory.appendingPathComponent(fileName)

        do {
            // Write data to temporary file
            try data.write(to: fileURL)

            // Create FileUploadDetails
            let details = FileUploadDetails(
                url: fileURL,
                data: data,
                fileExtension: "jpg",
                size: Double(data.count)
            )

            // Create FileUpload
            return .init(
                id: id,
                name: fileName,
                source: .camera,
                result: .success(details)
            )

        } catch {
            return .init(
                id: id,
                name: fileName,
                source: .camera,
                error: .other(error)
            )
        }
    }
}
