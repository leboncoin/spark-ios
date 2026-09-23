//
//  ButtonImageView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 24/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkButton")
struct ButtonImageView<ViewModel: ButtonMainViewModelDeprecated & ButtonMainSUIViewModelDeprecated>: View {

    // MARK: - Properties

    private let image: Image?
    private let size: CGFloat
    private let foregroundColor: (any ColorToken)?

    // MARK: - Initialization

    init(viewModel: ViewModel) {
        self.image = viewModel.controlStateImage.image
        self.size = viewModel.sizes?.imageSize ?? .zero
        self.foregroundColor = viewModel.colors?.iconColor
    }

    // MARK: - View

    var body: some View {
        if let image = self.image {
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .sparkFrame(
                    width: self.size,
                    height: self.size,
                    alignment: .center
                )
                .foregroundStyle(self.foregroundColor?.color ?? ColorTokenDefault.clear.color)
                .accessibilityIdentifier(ButtonAccessibilityIdentifier.imageView)
        }
    }
}
