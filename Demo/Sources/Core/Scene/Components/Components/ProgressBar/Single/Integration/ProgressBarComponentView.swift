//
//  ProgressBarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressBarComponentView = ComponentViewable<ProgressBarConfiguration, ProgressBarImplementationView, ProgressBarConfigurationView, ProgressBarExtraTools>

extension ProgressBarComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct ProgressBarImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressBarConfiguration>

    // MARK: - View

    var body: some View {
        SparkProgressBar(
            value: self.configurationWrapped.cgFloatValue()
        )
        .sparkTheme(self.configurationWrapped.theme.value)
        .sparkProgressBarIntent(self.configurationWrapped.intent)
        .sparkProgressBarShape(self.configurationWrapped.shape)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityValue(self.configurationWrapped)
    }
}
