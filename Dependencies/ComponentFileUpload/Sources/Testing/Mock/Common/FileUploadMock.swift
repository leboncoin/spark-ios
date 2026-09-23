//
//  FileUploadMock.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 14/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload

@_spi(SI_SPI) public extension FileUpload {

    static var mock: Self {
        .init(
            id: "id",
            name: "name",
            source: .camera,
            result: .success(.init(
                url: .documentsDirectory,
                data: Data(),
                fileExtension: "png",
                size: 100000
            ))
        )
    }

    static var mock2: Self {
        .init(
            id: "id2",
            name: "name2",
            source: .files,
            result: .success(.init(
                url: .applicationDirectory,
                data: Data(),
                fileExtension: "jpg",
                size: 200000
            ))
        )
    }

    static func mock(
        id: String? = "id3",
        name: String = "name3",
        source: FileUploadSource = .photos,
        url: URL = .homeDirectory,
        data: Data = .init(),
        fileExtension: String = "pdf",
        size: Double = 300000
    ) -> Self {
        .init(
            id: id ?? url.absoluteString,
            name: name,
            source: source,
            result: .success(.init(
                url: url,
                data: data,
                fileExtension: fileExtension,
                size: size
            ))
        )
    }
}
