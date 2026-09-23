//
//  FileUploadPreviewGetContentUseCase.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol FileUploadPreviewGetContentUseCaseable {
    func execute(
        file: FileUpload
    ) -> FileUploadPreviewContent
}

struct FileUploadPreviewGetContentUseCase: FileUploadPreviewGetContentUseCaseable {

    // MARK: - Methods

    func execute(
        file: FileUpload
    ) -> FileUploadPreviewContent {
        switch file.result {
        case .success(let details):
            let value = Measurement(value: details.size, unit: UnitInformationStorage.bytes)
            let size = value.formatted(.byteCount(style: .memory))

            return .init(fileSize: size)

        case .failure(let error):
            return .init(error: error.localizedDescription)
        }
    }
}
