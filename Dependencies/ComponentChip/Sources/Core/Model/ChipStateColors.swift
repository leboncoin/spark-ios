//
//  ChipStateColors.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 08.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct ChipStateColors: Equatable {

    // MARK: - Properties

    let border: any ColorToken
    let pressedBorder: any ColorToken
    let selectedBorder: any ColorToken
    let content: any ColorToken
    let selectedContent: any ColorToken
    let background: any ColorToken
    let pressedBackground: any ColorToken
    let selectedBackground: any ColorToken

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.border.equals(rhs.border) &&
        lhs.pressedBorder.equals(rhs.pressedBorder) &&
        lhs.selectedBorder.equals(rhs.selectedBorder) &&
        lhs.content.equals(rhs.content) &&
        lhs.selectedContent.equals(rhs.selectedContent) &&
        lhs.background.equals(rhs.background) &&
        lhs.pressedBackground.equals(rhs.pressedBackground) &&
        lhs.selectedBackground.equals(rhs.selectedBackground)
    }
}
