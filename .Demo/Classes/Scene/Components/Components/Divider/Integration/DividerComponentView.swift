//
//  DividerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias DividerComponentView = ComponentViewable<DividerConfiguration, DividerImplementationView, DividerConfigurationView>

extension DividerComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct DividerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<DividerConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .demoAccessibilityLabel(self.configurationWrapped)
    }

    private func component() -> DividerView {
        if !self.configurationWrapped.text.isEmpty {
            return DividerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                axis: self.configurationWrapped.axis,
                alignment: self.configurationWrapped.alignment,
                text: {
                    Text(self.configurationWrapped.text)
                }
            )
        } else {
            return DividerView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                axis: self.configurationWrapped.axis,
                alignment: self.configurationWrapped.alignment
            )
        }
    }
}

// MARK: - Preview

struct DividerComponentView_Previews: PreviewProvider {
    static var previews: some View {
        DividerComponentView()
    }
}
