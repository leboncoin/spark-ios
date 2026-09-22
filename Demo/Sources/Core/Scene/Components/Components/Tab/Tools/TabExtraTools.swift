//
//  TabExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TabExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=267-8337"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-tab/documentation/sparkcomponenttab/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = TabCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = TabUICodeSyntaxes.content
}
