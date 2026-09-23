//
//  FileUploadButtonClearFilesService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import PhotosUI

struct FileUploadButtonClearFilesService {

    // MARK: - Methods

    func execute(
        _ files: inout [FileUpload],
        photoSelection: [PhotosPickerItem]
    ) {
        files.removeAll(where: { file in
            guard file.source == .photos else {
                return false
            }

            let containsOnPhoto = photoSelection.contains(where: { $0.itemIdentifier == file.id })
            return !(containsOnPhoto)
        })
    }
}
