//
//  AdaptativeStackComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias AdaptativeStackComponentView = ComponentViewable<AdaptativeStackConfiguration, AdaptativeStackImplementationView, AdaptativeStackConfigurationView, AdaptativeStackExtraTools>

extension AdaptativeStackComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct AdaptativeStackImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<AdaptativeStackConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        switch self.configurationWrapped.axis {
        case .horizontal:
            SparkAdaptiveStack(
                axis: .horizontal,
                alignment: self.configurationWrapped.alignment.swiftUI,
                spacing: self.configurationWrapped.spacing,
                accessibilityAlignment: self.configurationWrapped.accessibilityAlignment.swiftUI,
                accessibilitySpacing: self.configurationWrapped.accessibilitySpacing
            ) {
                Text(self.configurationWrapped.text1)
                Text(self.configurationWrapped.text2)
                Text(self.configurationWrapped.text3)
            }

        case .vertical:
            SparkAdaptiveStack(
                axis: .vertical,
                alignment: self.configurationWrapped.alignment.swiftUI,
                spacing: self.configurationWrapped.spacing,
                accessibilityAlignment: self.configurationWrapped.accessibilityAlignment.swiftUI,
                accessibilitySpacing: self.configurationWrapped.accessibilitySpacing
            ) {
                Text(self.configurationWrapped.text1)
                Text(self.configurationWrapped.text2)
                Text(self.configurationWrapped.text3)
            }
        }
    }
}
