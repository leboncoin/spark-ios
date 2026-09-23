//
//  BadgeExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BadgeExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-15510"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-badge/documentation/sparkcomponentbadge/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = BadgeCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = BadgeUICodeSyntaxes.content
}
