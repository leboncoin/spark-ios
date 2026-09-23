//
//  TabsGetAttributesUseCaseDeprecated.swift
//  SparkComponentTab
//
//  Created by michael.zimmermann on 30.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
protocol TabsGetAttributesUseCaseableDeprecated {
    func execute(theme: any Theme, size: TabSize, isEnabled: Bool) -> TabsAttributesDeprecated
}

/// TabGetColorUseCase
/// Use case to determin the colors of the Tab by the intent
/// Functions:
/// - execute: returns a color token for given colors and an intent
struct TabsGetAttributesUseCaseDeprecated: TabsGetAttributesUseCaseableDeprecated {

    // MARK: - Methods
    ///
    /// Calculate the attributes of the tab control depending on wheter it is enabled or not.
    ///
    /// - Parameters:
    ///    - theme: The theme
    ///    - size: The tab size
    ///    - isEnabled: Bool.
    ///
    /// - Returns: ``TabsAttributesDeprecated`` containing colors and line hight of the tab control.
    func execute(theme: any Theme, size: TabSize, isEnabled: Bool) -> TabsAttributesDeprecated {

        var lineColor = theme.colors.base.outline
        if !isEnabled {
            lineColor = lineColor.opacity(theme.dims.dim3)
        }

        return TabsAttributesDeprecated(
            lineHeight: theme.border.width.small,
            itemHeight: size.itemHeight,
            lineColor: lineColor,
            backgroundColor: ColorTokenDefault.clear
        )
    }
}
