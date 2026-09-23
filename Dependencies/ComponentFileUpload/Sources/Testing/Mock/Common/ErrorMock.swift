//
//  ErrorMock.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 04/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum ErrorMock: LocalizedError {
    case value

    // MARK: - Properties

    var errorDescription: String? {
        return "Error mocked !"
    }
}
