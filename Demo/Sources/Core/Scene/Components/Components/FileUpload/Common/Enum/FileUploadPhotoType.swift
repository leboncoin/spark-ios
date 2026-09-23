//
//  FileUploadPhotoType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import PhotosUI

enum FileUploadPhotoType: String, CaseIterable, Hashable {
    case images
    case videos
    case sparkDefault
    case none

    // MARK: - Properties

    var toUITypes: [PHPickerFilter] {
        switch self {
        case .images: [.images]
        case .videos: [.videos]
        case .sparkDefault: .sparkDefaults
        case .none: []
        }
    }
}
