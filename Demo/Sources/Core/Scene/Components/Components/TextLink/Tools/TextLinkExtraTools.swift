//
//  TextLinkExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextLinkExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=8638-1179"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-text-link/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = TextLinkCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = TextLinkUICodeSyntaxes.content
}
