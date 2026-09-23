//
//  ButtonExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ButtonExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=18-1591"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-button/documentation/sparkcomponentbutton/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = ButtonCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = ButtonUICodeSyntaxes.content
}
