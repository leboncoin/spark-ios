//
//  FileUploadPreviewGetImageUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGetImageUseCaseable {
    func execute(
        file: FileUpload
    ) -> FileUploadPreviewImage
}

struct FileUploadPreviewGetImageUseCase: FileUploadPreviewGetImageUseCaseable {

    // MARK: - Methods

    func execute(
        file: FileUpload
    ) -> FileUploadPreviewImage {
        guard case .success(let details) = file.result else {
            return .error
        }

        return switch details.previewType {
        case .file: .file
        case .image: .image
        case .pdf: .pdf
        case .video: .video
        }
    }
}
