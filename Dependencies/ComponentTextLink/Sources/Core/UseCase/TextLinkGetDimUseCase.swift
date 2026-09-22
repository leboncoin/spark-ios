//
//  TextLinkGetDimUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetDimUseCaseable {

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TextLinkIntent,
        isHighlighted: Bool
    ) -> CGFloat
}

struct TextLinkGetDimUseCase: TextLinkGetDimUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TextLinkIntent,
        isHighlighted: Bool
    ) -> CGFloat {
        let applyDim1 = switch intent {
        case .custom: true
        case .accentContainer,
                .onAccentContainer,
                .alertContainer,
                .dangerContainer,
                .infoContainer,
                .mainContainer,
                .neutralContainer,
                .successContainer,
                .supportContainer: true
        default: false
        }

        let dims = theme.dims
        return if applyDim1 {
            isHighlighted ? dims.dim1 : dims.none
        } else {
            dims.none
        }
    }
}
