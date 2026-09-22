//
//  RatingStarView.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 09/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkResources
@_spi(SI_SPI) import SparkCommon

struct RatingStarView: View {

    // MARK: - Properties

    let colors: RatingColors
    let ratio: CGFloat

    // MARK: - View

    var body: some View {
        switch self.ratio {
        case 0: // Only stroke image
            self.strokeImage()

        case 1: // Filled image
            self.filledImage()

        default: // Both images with mask
            ZStack {
                self.filledImage()
                    .mask(ratio: self.ratio, alignment: .leading)

                self.strokeImage()
                    .mask(ratio: 1 - self.ratio, alignment: .trailing)
            }
        }
    }

    // MARK: - Subviews

    private func strokeImage() -> some View {
        Image(spark: \.starOutline)
            .resizable()
            .foregroundStyle(self.colors.strokeStarTintColorToken)
    }

    private func filledImage() -> some View {
        Image(spark: \.starFill)
            .resizable()
            .foregroundStyle(self.colors.filledStarTintColorToken)
    }
}

// MARK: - Extension

private extension View {

    func mask(ratio: CGFloat, alignment: Alignment) -> some View {
        self.mask(
            GeometryReader { reader in
                Rectangle()
                    .frame(width: reader.size.width * ratio)
                    .frame(maxWidth: .infinity, alignment: alignment)
            }
        )
    }
}
