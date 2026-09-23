//
//  SparkHStack+InitExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

extension SparkHStack {

    init(
        spacing: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    )  {
        self.init(
            alignment: .top,
            spacing: spacing,
            content: content
        )
    }
}
