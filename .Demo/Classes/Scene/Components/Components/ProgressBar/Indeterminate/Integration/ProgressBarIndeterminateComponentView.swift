//
//  ProgressBarIndeterminateComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressBarIndeterminateComponentView = ComponentViewable<ProgressBarIndeterminateConfiguration, ProgressBarIndeterminateImplementationView, ProgressBarIndeterminateConfigurationView>

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
        ProgressBarIndeterminateView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            shape: self.configurationWrapped.shape,
            isAnimating: self.configurationWrapped.isAnimating
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

// MARK: - Preview

struct ProgressBarIndeterminateComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarIndeterminateComponentView()
    }
}
