//
//  IconComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias IconComponentView = ComponentViewable<IconConfiguration, IconImplementationView, IconConfigurationView>

// MARK: - Subview

struct IconImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<IconConfiguration>

    // MARK: - View

    var body: some View {
        IconView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            size: self.configurationWrapped.size,
            iconImage: .init(icon: self.configurationWrapped.icon)
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

// MARK: - Preview

struct IconComponentView_Previews: PreviewProvider {
    static var previews: some View {
        IconComponentView()
    }
}
