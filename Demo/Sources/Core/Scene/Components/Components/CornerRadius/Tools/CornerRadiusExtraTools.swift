//
//  CornerRadiusExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CornerRadiusExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = nil
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-common/documentation/sparkcommon"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = CornerRadiusCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = CornerRadiusUICodeSyntaxes.content
}
