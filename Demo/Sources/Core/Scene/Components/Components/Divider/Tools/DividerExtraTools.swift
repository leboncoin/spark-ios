//
//  DividerExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct DividerExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-21226"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-divider/documentation/sparkcomponentdivider/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = DividerCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = DividerUICodeSyntaxes.content
}
