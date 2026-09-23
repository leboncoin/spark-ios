//
//  ColorItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorItemView: View {

    // MARK: - Properties

    let viewModel: ColorItemViewModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            Text(self.viewModel.name)
                .font(.title2)

            HStack(spacing: .medium) {
                // Light mode
                ColorItemShape(
                    color: self.viewModel.color.resolveColor(
                        userInterfaceStyle: .light,
                        contrast: .normal
                    )
                )

                // Dark mode
                ColorItemShape(
                    color: self.viewModel.color.resolveColor(
                        userInterfaceStyle: .dark,
                        contrast: .normal
                    )
                )

                // High contrast light
                ColorItemShape(
                    color: self.viewModel.color.resolveColor(
                        userInterfaceStyle: .light,
                        contrast: .high
                    )
                )

                // High contrast dark
                ColorItemShape(
                    color: self.viewModel.color.resolveColor(
                        userInterfaceStyle: .dark,
                        contrast: .high
                    )
                )
            }
            .frame(height: 50)
        }
    }
}

// MARK: - Subview

private struct ColorItemShape: View {

    // MARK: - Properties

    let color: Color

    // MARK: - View

    var body: some View {
        RoundedRectangle(cornerRadius: 12, )
            .stroke(.gray.opacity(0.3), lineWidth: 2)
            .fill(color)
    }
}

// MARK: - Extension

private extension Color {

    func resolveColor(userInterfaceStyle: UIUserInterfaceStyle, contrast: UIAccessibilityContrast) -> Color {
        let traits = UITraitCollection { mutableTraits in
            mutableTraits.userInterfaceStyle = userInterfaceStyle
            mutableTraits.accessibilityContrast = contrast
        }

        let uiColor = UIColor(self).resolvedColor(with: traits)
        return Color(uiColor: uiColor)
    }
}
