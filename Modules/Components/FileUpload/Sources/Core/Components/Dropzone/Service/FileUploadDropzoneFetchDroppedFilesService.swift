//
//  FileUploadDropzoneFetchDroppedFilesService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadDropzoneFetchDroppedFilesService {

    // MARK: - Properties

    private let convertURLService: FileUploadConvertURLServicing

    // MARK: - Initialization

    init(convertURLService: FileUploadConvertURLServicing = FileUploadConvertURLService()) {
        self.convertURLService = convertURLService
    }

    // MARK: - Methods

    func execute(
        from providers: [NSItemProvider],
        existingFiles: [FileUpload]
    ) async -> [FileUpload] {
        await withTaskGroup(of: FileUpload?.self) { group in
            for provider in providers {
                group.addTask {
                    await self.processProvider(provider, existingFiles: existingFiles)
                }
            }

            var files = [FileUpload]()
            for await file in group {
                if let file = file {
                    files.append(file)
                }
            }

            return files
        }
    }

    // MARK: - Private Methods

    private func processProvider(
        _ provider: NSItemProvider,
        existingFiles: [FileUpload]
    ) async -> FileUpload? {
        await withCheckedContinuation { continuation in
            _ = provider.loadFileRepresentation(for: .data) { url, _, error in
                guard let url = url else {
                    continuation.resume(returning: nil)
                    return
                }

                let file: FileUpload

                if let error = error {
                    file = .init(url: url, error: error)
                } else {
                    do {
                        file = try self.convertURLService.execute(from: url)
                    } catch {
                        file = .init(url: url, error: error)
                    }
                }

                // Only return file if it doesn't already exist
                if existingFiles.notContains(file.id) {
                    continuation.resume(returning: file)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
