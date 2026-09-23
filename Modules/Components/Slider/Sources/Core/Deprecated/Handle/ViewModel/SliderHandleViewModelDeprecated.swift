//
//  SliderHandleViewModelDeprecated.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import Combine

@available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
final class SliderHandleViewModelDeprecated: ObservableObject {

    @Published var color: any ColorToken
    @Published var activeIndicatorColor: any ColorToken

    init(color: some ColorToken,
         activeIndicatorColor: some ColorToken) {
        self.color = color
        self.activeIndicatorColor = activeIndicatorColor
    }
}
