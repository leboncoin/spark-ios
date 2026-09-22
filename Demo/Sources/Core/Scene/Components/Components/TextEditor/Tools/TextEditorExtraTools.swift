//
//  TextEditorExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextEditorExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=3661-22748"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-text-input/documentation/sparkcomponenttextinput/#TextEditor"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = TextEditorCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = TextEditorUICodeSyntaxes.content
}
