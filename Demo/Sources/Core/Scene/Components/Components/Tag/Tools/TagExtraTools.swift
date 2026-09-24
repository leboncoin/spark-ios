//
//  TagExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TagExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=631-15420"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios/sparkcomponenttag/documentation/sparkcomponenttag/documentation"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = TagCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = TagUICodeSyntaxes.content
}
