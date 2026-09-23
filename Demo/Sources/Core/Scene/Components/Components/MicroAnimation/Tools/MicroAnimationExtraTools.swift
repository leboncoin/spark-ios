//
//  MicroAnimationExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct MicroAnimationExtraTools: ComponentExtraTools {

    // MARK: - Link Properties

    let figmaLink: String? = nil
    let documentationLink: String? = "https://leboncoin.github.io/spark-ios-common/documentation/sparkcommon/swiftuicore/view/animate(type:play:delay:repeat:completion:)"

    // MARK: - Code Syntax

    let swiftUICodeSyntaxes: [CodeSyntax] = MicroAnimationCodeSyntaxes.content
    let uiKitCodeSyntaxes: [CodeSyntax] = MicroAnimationUICodeSyntaxes.content
}
