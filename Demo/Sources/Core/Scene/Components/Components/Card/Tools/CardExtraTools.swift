//
//  CardExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CardExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=59075-1497"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-card/documentation/sparkcomponentcard/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = CardCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = CardUICodeSyntaxes.content
}
