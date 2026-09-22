//
//  TextFieldExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextFieldExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=267-8336"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-text-input/documentation/sparkcomponenttextinput/#TextField"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = TextFieldCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = TextFieldUICodeSyntaxes.content
}
