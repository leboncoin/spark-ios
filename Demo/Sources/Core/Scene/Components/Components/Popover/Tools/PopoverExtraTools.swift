//
//  PopoverExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct PopoverExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=4337-30927"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-popover/documentation/sparkcomponentpopover/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = PopoverCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = PopoverUICodeSyntaxes.content
}
