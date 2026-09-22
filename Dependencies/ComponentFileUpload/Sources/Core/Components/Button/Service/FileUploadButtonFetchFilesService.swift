//
//  FileUploadButtonFetchFilesService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadButtonFetchFilesService {

    // MARK: - Properties

    private let convertURLService: FileUploadConvertURLServicing

    // MARK: - Initialization

    init(convertURLService: FileUploadConvertURLServicing = FileUploadConvertURLService()) {
        self.convertURLService = convertURLService
    }

    // MARK: - Methods

    func execute(
        from result: Result<[URL], any Error>,
        files: [FileUpload]
    ) -> [FileUpload] {
        switch result {
        case .success(let urls):
            return self.execute(urls, files: files)

        case .failure(let error):
            return [
                .init(
                    source: .files,
                    error: .other(error)
                )
            ]
        }
    }

    // MARK: - Private Methods

    private func execute(
        _ selection: [URL],
        files: [FileUpload]
    ) -> [FileUpload] {
        var newFiles = [FileUpload]()

        for url in selection {

            let id = url.absoluteString

            // Only if it is a new selected file
            if files.notContains(id) {

                let file: FileUpload

                do {
                    file = try self.convertURLService.execute(from: url)

                } catch {
                    file = .init(
                        id: id,
                        name: url.lastPathComponent,
                        source: .files,
                        error: .fileDataConversion(error)
                    )
                }

                // Add the new file in the list
                newFiles.append(file)
            }
        }

        return newFiles
    }
}
