//
//  FileUpload+DropzoneInitExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension FileUpload: FileUploadConvertible {

    // Used only by the drop gesture in dropzone
    init(
        name: String,
        fileExtension: String,
        size: Double,
        url: URL,
        data: Data
    ) {
        self.init(
            id: url.absoluteString,
            name: name,
            source: .drop,
            result: .success(.init(
                url: url,
                data: data,
                fileExtension: fileExtension,
                size: size
            ))
        )
    }

    // Used only by the drop gesture in dropzone
    init(
        url: URL,
        error: Error
    ) {
        self.init(
            id: url.absoluteString,
            source: .drop,
            error: .dropConversion(error)
        )
    }
}
