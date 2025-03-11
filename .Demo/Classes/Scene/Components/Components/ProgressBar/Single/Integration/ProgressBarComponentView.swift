//
//  ProgressBarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressBarComponentView = ComponentViewable<ProgressBarConfiguration, ProgressBarImplementationView, ProgressBarConfigurationView>

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
        ProgressBarView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            shape: self.configurationWrapped.shape,
            value: self.configurationWrapped.cgFloatValue()
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

// MARK: - Preview

struct ProgressBarComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarComponentView()
    }
}
