//
//  FileUploadButtonClearPhotosSelectionService.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import PhotosUI

struct FileUploadButtonClearPhotosSelectionService {

    // MARK: - Methods

    func execute(
        _ selection: inout [PhotosPickerItem],
        files: [FileUpload]
    ) {
        selection.removeAll(where: { photo in
            !files.map(\.id).contains(photo.itemIdentifier)
        })
    }
}
