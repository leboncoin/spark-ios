//
//  StepperExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct StepperExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=51908-6090"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-stepper/documentation/sparkcomponentstepper/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = StepperCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = StepperUICodeSyntaxes.content
}
