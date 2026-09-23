//
//  FileUploadDropzoneExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FileUploadDropzoneExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=59809-4315"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-file-upload/documentation/sparkcomponentfileupload/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = FileUploadDropzoneCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = []
}
