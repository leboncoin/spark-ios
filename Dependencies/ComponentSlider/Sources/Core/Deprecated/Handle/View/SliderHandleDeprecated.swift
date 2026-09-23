//
//  SliderHandleDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 13/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

struct SliderHandleDeprecated: View {

    @ObservedObject var viewModel: SliderHandleViewModelDeprecated

    @Binding var isEditing: Bool

    init(viewModel: SliderHandleViewModelDeprecated,
         isEditing: Binding<Bool>) {
        self.viewModel = viewModel
        _isEditing = isEditing
    }

    var body: some View {
        ZStack(alignment: .center) {
            if self.isEditing {
                self.activeIndicatorStroke()
                self.activeIndicatorHalo()
            }
            Circle()
                .fill()
                .foregroundColor(self.viewModel.color.color)
                .frame(width: SliderConstantsDeprecated.handleSize.width, height: SliderConstantsDeprecated.handleSize.height)
        }
    }

    @ViewBuilder
    private func activeIndicatorStroke() -> some View {
        Circle()
            .strokeBorder(self.viewModel.color.color, lineWidth: 1.0)
            .frame(width: SliderConstantsDeprecated.activeIndicatorSize.width, height: SliderConstantsDeprecated.activeIndicatorSize.height)
    }

    @ViewBuilder
    private func activeIndicatorHalo() -> some View {
        Circle()
            .fill(self.viewModel.activeIndicatorColor)
            .frame(width: SliderConstantsDeprecated.activeIndicatorSize.width - 2, height: SliderConstantsDeprecated.activeIndicatorSize.height - 2)
    }
}
