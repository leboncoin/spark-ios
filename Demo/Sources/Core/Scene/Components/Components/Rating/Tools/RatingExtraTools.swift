//
//  RatingExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RatingExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=7792-7244"
    let documentationLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=7792-7244"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = RatingCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = RatingUICodeSyntaxes.content
}
