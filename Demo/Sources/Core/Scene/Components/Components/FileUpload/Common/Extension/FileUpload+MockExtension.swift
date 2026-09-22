//
//  FileUpload+MockExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension FileUpload {

    static let mock: FileUpload = .init(
        id: "1",
        name: "sample.pdf",
        source: .files,
        result: .success(.init(
            url: URL(string: "https://pdfobject.com/pdf/sample.pdf") ?? URL(fileURLWithPath: ""),
            data: Data(count: 1024),
            fileExtension: "pdf",
            size: 100000
        ))
    )

    static let errorMock: FileUpload = .init(
        id: "2",
        name: "sample.pdf",
        source: .files,
        result: .failure(.other(CustomError()))
    )
}

// MARK: - Error

private struct CustomError: Error {
}

