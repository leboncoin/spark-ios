//
//  TextLinkComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 23/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TextLinkComponentView = ComponentViewable<TextLinkConfiguration, TextLinkImplementationView, TextLinkConfigurationView, TextLinkExtraTools>

// MARK: - Subview

struct TextLinkImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextLinkConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        SparkTextLink(
            self.configuration.wrappedValue.getText(),
            image: .init(icon: self.configuration.wrappedValue.icon),
            action: {
                self.showAlertAction = true
            }
        )
        .sparkTheme(self.configuration.wrappedValue.theme.value)
        .sparkTextLinkAlignment(self.configuration.wrappedValue.alignment)
        .sparkTextLinkHighlightRange(self.configuration.wrappedValue.getTextHighlightRange())
        .sparkTextLinkIntent(self.configuration.wrappedValue.intent.toRealType(self.configurationWrapped))
        .sparkTextLinkTypography(self.configuration.wrappedValue.typography)
        .sparkTextLinkVariant(self.configuration.wrappedValue.variant)
        .multilineTextAlignment(self.configuration.wrappedValue.swiftUITextAlignment)
        .lineLimit(self.configuration.wrappedValue.numberOfLine > 0 ? self.configuration.wrappedValue.numberOfLine : nil)
        .demoAccessibilityLabel(self.configuration.wrappedValue)
        .demoAccessibilityValue(self.configuration.wrappedValue)
        .alertAction("TextLink tap", showAlert: self.$showAlertAction)
    }
}
