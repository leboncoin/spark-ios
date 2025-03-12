//
//  BadgeComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BadgeComponentView = ComponentViewable<BadgeConfiguration, BadgeImplementationView, BadgeConfigurationView>

// MARK: - Subview

struct BadgeImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BadgeConfiguration>

    // MARK: - View

    var body: some View {
        BadgeView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            value: Int(self.configurationWrapped.value)
        )
        .size(self.configurationWrapped.size)
        .format(self.configurationWrapped.format.sparkValue(
            customText: self.configurationWrapped.customText,
            overflowValue: self.configurationWrapped.overflowValue
        ))
        .borderVisible(self.configurationWrapped.isBorderVisible)
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

// MARK: - Preview

struct BadgeComponentView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeComponentView()
    }
}
