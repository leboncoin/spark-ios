//
//  TextLinkGetDimUseCaseDeprecated.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 03/06/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used by the new SparkTextLink or SparkUITextLink")
protocol TextLinkGetDimUseCaseDeprecatedable {

    // sourcery: dims = "Identical"
    func execute(
        intent: TextLinkIntent,
        isHighlighted: Bool,
        dims: any Dims
    ) -> CGFloat
}

struct TextLinkGetDimUseCaseDeprecated: TextLinkGetDimUseCaseDeprecatedable {

    // MARK: - Methods

    func execute(
        intent: TextLinkIntent,
        isHighlighted: Bool,
        dims: any Dims
    ) -> CGFloat {

        let applyDim1 = switch intent {
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

        return if applyDim1 {
            isHighlighted ? dims.dim1 : dims.none
        } else {
            dims.none
        }
    }
}
