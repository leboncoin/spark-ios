//
//  FormFieldExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FormFieldExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=44899-1278"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-form-field/documentation/sparkcomponentformfield/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = FormFieldCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = FormFieldUICodeSyntaxes.content
}
