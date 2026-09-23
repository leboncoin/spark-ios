//
//  UnevenRoundedRectangle+HighlightedExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 03/12/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

internal extension UnevenRoundedRectangle {

    init(
        topLeadingRadius: CGFloat,
        bottomLeadingRadius: CGFloat,
        bottomTrailingRadius: CGFloat,
        topTrailingRadius: CGFloat,
        isHighlighted: Bool,
        style: RoundedCornerStyle = .circular
    ) {
        self.init(
            topLeadingRadius: topLeadingRadius,
            bottomLeadingRadius: isHighlighted ? .zero : bottomLeadingRadius,
            bottomTrailingRadius: bottomTrailingRadius,
            topTrailingRadius: topTrailingRadius,
            style: style
        )
    }
}
