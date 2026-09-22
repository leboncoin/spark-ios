//
//  URL+ResourcesExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 10/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing

extension URL {

    // MARK: - Properties

    static var imageMock: URL {
        get throws {
            try self.file(ext: ".jpg")
        }
    }

    static var pdfMock: URL {
        get throws {
            try self.file(ext: ".pdf")
        }
    }

    static var txtMock: URL {
        get throws {
            try self.file(ext: ".txt")
        }
    }

    static var txt2Mock: URL {
        get throws {
            try self.file("example2", ext: ".txt")
        }
    }

    // MARK: - Private Methods

    private static var bundle: Bundle {
        .module
    }

    private static func file(_ resource: String = "example", ext: String) throws -> URL {
        try #require(self.bundle.url(
            forResource: resource,
            withExtension: ext
        ))
    }
}
