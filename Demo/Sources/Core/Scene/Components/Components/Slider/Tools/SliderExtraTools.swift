//
//  SliderExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SliderExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=3282-22023"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-slider/documentation/sparkcomponentslider/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = SliderCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = SliderUICodeSyntaxes.content
}
