//
//  IconExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct IconExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=60972-1300"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-icon/documentation/sparkcomponenticon/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = IconCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = IconUICodeSyntaxes.content
}
