//
//  SpinnerExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SpinnerExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=2411-23008"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-spinner/documentation/sparkcomponentspinner/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = SpinnerCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = SpinnerUICodeSyntaxes.content
}
