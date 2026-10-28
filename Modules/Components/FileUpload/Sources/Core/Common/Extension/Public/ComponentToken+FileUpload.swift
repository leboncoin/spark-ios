//
//  ComponentToken+FileUpload.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the FileUpload components derived from the theme.
    var fileUpload: FileUploadToken {
        return .init(theme: self.theme)
    }
}
