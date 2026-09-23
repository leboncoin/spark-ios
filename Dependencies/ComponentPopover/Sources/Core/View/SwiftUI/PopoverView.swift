//
//  PopoverView.swift
//  SparkComponentPopover
//
//  Created by Michael Zimmermann on 02/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

@available(iOS 16.4, *)
struct PopoverView<Content>: View where Content: View {

    private let viewModel: PopoverViewModel
    private let content: (PopoverColors) -> Content

    init(
        theme: any Theme,
        intent: PopoverIntent,
        showArrow: Bool,
        content: @escaping (PopoverColors) -> Content
    ) {
        self.viewModel = .init(theme: theme, intent: intent, showArrow: showArrow)
        self.content = content
    }

    var body: some View {
        ZStack {
            if !PopoverConstants.isLiquidGlass {
                self.viewModel.colors.background.color
                    .scaleEffect(2)  // Needed to fill the arrow
            }

            self.content(self.viewModel.colors)
                .padding(
                    EdgeInsets(
                        vertical: self.viewModel.spaces.vertical,
                        horizontal: self.viewModel.spaces.horizontal
                    )
                )
        }
        .presentationCompactAdaptation(.popover)
    }
}
