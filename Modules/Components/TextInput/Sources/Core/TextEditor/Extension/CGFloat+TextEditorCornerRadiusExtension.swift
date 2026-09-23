//
//  CGFloat+TextEditorCornerRadiusExtension.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension CGFloat {

    static func textEditorRadius(_ radius: CGFloat) -> CGFloat {
        let maxRadius = TextInputConstants.height / 2
        return .minimum(radius, maxRadius)
    }
}
