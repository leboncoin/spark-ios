//
//  ProgressBarExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=7229-1207"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-progress-bar/documentation/sparkcomponentprogressbar/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = ProgressBarCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = ProgressBarUICodeSyntaxes.content
}
