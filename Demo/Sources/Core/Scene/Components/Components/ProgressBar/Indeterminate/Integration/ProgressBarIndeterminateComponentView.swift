//
//  ProgressBarIndeterminateComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressBarIndeterminateComponentView = ComponentViewable<ProgressBarIndeterminateConfiguration, ProgressBarIndeterminateImplementationView, ProgressBarIndeterminateConfigurationView, ProgressBarIndeterminateExtraTools>

extension ProgressBarIndeterminateComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct ProgressBarIndeterminateImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressBarIndeterminateConfiguration>

    // MARK: - View

    var body: some View {
        SparkProgressBarIndeterminate(
            isAnimated: self.configurationWrapped.isAnimating
        )
        .sparkTheme(self.configurationWrapped.theme.value)
        .sparkProgressBarIntent(self.configurationWrapped.intent)
        .sparkProgressBarShape(self.configurationWrapped.shape)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityHidden(self.configurationWrapped)
    }
}
