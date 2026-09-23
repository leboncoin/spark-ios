//
//  ChipExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ChipExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-21226"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-chip/documentation/sparkcomponentchip/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = ChipCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = ChipUICodeSyntaxes.content
}
