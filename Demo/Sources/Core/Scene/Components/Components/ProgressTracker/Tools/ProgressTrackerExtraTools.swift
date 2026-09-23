//
//  ProgressTrackerExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressTrackerExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=12212-6713"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-progress-tracker/documentation/sparkcomponentprogresstracker/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = ProgressTrackerCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = ProgressTrackerUICodeSyntaxes.content
}
