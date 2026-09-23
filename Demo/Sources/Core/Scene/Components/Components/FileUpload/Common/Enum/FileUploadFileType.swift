//
//  FileUploadFileType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UniformTypeIdentifiers

enum FileUploadFileType: String, CaseIterable, Hashable {
    case pdf
    case movie
    case image
    case text
    case plainText
    case sparkDefault
    case none

    // MARK: - Properties

    var toUITypes: [UTType] {
        switch self {
        case .pdf: [.pdf]
        case .movie: [.movie]
        case .image: [.image]
        case .text: [.text]
        case .plainText: [.plainText]
        case .sparkDefault: .sparkDefaults
        case .none: []
        }
    }
}
