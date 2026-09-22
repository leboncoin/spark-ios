//
//  ToggleExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ToggleExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=267-8340"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-selection-controls/documentation/sparkcomponentselectioncontrols/#ToggleSwitch"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = ToggleCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = ToggleUICodeSyntaxes.content
}
