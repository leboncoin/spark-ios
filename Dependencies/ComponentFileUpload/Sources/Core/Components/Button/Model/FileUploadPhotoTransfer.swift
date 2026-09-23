//
//  FileUploadPhotoTransfer.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 26/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Photos
import SwiftUI

struct FileUploadPhotoTransfer: Transferable, FileUploadConvertible {

    // MARK: - Properties

    let name: String
    let fileExtension: String
    let size: Double
    let url: URL
    let data: Data

    // MARK: - Static Properties

    static var convertURLService: FileUploadConvertURLServicing = FileUploadConvertURLService()

    // MARK: - Methods

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { receivedData in
            return try self.fileUpload(from: receivedData)
        }

        FileRepresentation(contentType: .image) { movie in
            SentTransferredFile(movie.url)
        } importing: { receivedData in
            return try self.fileUpload(from: receivedData)
        }
    }

    // MARK: - Private Methods

    private static func fileUpload(
        from receivedData: ReceivedTransferredFile
    ) throws -> Self {
        try self.convertURLService.execute(
            from: receivedData.file
        )
    }
}
