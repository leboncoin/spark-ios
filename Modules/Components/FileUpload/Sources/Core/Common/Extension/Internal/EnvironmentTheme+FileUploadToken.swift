//
//  EnvironmentTheme+FileUploadToken.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Properties

    var fileUpload: FileUploadToken {
        self.value.component.fileUpload
    }
}
