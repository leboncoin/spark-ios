//
//  RadioButtonExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RadioButtonExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=127-6137"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-selection-controls/documentation/sparkcomponentselectioncontrols/#RadioButton"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = RadioButtonCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = RadioButtonUICodeSyntaxes.content
}
