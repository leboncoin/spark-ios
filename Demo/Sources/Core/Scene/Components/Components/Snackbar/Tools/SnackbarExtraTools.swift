//
//  SnackbarExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SnackbarExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=43405-12813"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-snackbar/documentation/sparkcomponentsnackbar/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = SnackbarCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = SnackbarUICodeSyntaxes.content
}
