//
//  SegmentedGaugeExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedGaugeExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = "https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=60972-1300"
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-component-segmented-gauge/documentation/sparkcomponentsegmentedgauge/"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = SegmentedGaugeCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = SegmentedGaugeUICodeSyntaxes.content
}
