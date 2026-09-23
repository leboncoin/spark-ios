//
//  CheckboxExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CheckboxExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=127-1880"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-selection-controls/documentation/sparkcomponentselectioncontrols/#Checkbox"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = CheckboxCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = CheckboxUICodeSyntaxes.content
}
