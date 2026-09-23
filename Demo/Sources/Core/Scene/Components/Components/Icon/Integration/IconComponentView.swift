//
//  IconComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias IconComponentView = ComponentViewable<IconConfiguration, IconImplementationView, IconConfigurationView, IconExtraTools>

// MARK: - Subview

struct IconImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<IconConfiguration>

    // MARK: - View

    var body: some View {
        SparkIcon(.init(icon: self.configurationWrapped.icon))
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkIconIntent(self.configurationWrapped.intent.toRealType(self.configurationWrapped))
            .sparkIconSize(self.configurationWrapped.size.toRealType(self.configurationWrapped))
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityHidden(self.configurationWrapped)
    }
}
