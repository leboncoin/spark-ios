//
//  FileUploadButtonFetchPhotosService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import PhotosUI

struct FileUploadButtonFetchPhotosService {

    // MARK: - Methods

    func execute(
        from selection: [PhotosPickerItem],
        files: [FileUpload]
    ) async -> [FileUpload] {
        var newFiles = [FileUpload]()

        for photo in selection {
            if let id = photo.itemIdentifier {

                // Only if it is a new selected file
                if files.notContains(id) {

                    let file: FileUpload
                    let source: FileUploadSource = .photos

                    do {
                        let result = try await photo.loadTransferable(type: FileUploadPhotoTransfer.self)

                        switch result {
                        case .some(let transfer):
                            file = .init(id: id, transfer: transfer)

                        case .none:
                            file = .init(
                                id: id,
                                source: source,
                                error: .photoTransfer(nil)
                            )
                        }

                    } catch {
                        file = .init(
                            id: id,
                            source: source,
                            error: .photoTransfer(error)
                        )
                    }

                    // Add the new file in the list
                    newFiles.append(file)
                }
            }
        }

        return newFiles
    }
}
