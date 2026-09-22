//
//  BottomSheetExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BottomSheetExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = nil
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-bottom-sheet/documentation/sparkcomponentbottomsheet/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = BottomSheetCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = BottomSheetUICodeSyntaxes.content
}
