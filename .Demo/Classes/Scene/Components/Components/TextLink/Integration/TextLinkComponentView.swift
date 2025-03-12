//
//  TextLinkComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 23/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: To fix :
// Check to migrate sizeCategory in TextLink to dynamicTypeSize.

// MARK: - View

typealias TextLinkComponentView = ComponentViewable<TextLinkConfiguration, TextLinkImplementationView, TextLinkConfigurationView>

// MARK: - Subview

struct TextLinkImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextLinkConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        TextLinkView(
            theme: self.configuration.wrappedValue.theme.value,
            text: self.configuration.wrappedValue.getText(),
            textHighlightRange: self.configuration.wrappedValue.getTextHighlightRange(),
            intent: self.configuration.wrappedValue.intent,
            typography: self.configuration.wrappedValue.typography,
            variant: self.configuration.wrappedValue.variant,
            image: .init(icon: self.configuration.wrappedValue.icon),
            alignment: self.configuration.wrappedValue.alignment,
            action: {
                self.showAlertAction = true
            }
        )
        .multilineTextAlignment(self.configuration.wrappedValue.swiftUITextAlignment)
        .lineLimit(self.configuration.wrappedValue.numberOfLine > 0 ? self.configuration.wrappedValue.numberOfLine : nil)
        .demoAccessibilityLabel(self.configuration.wrappedValue)
        .demoAccessibilityValue(self.configuration.wrappedValue)
        .alertAction("TextLink tap", showAlert: self.$showAlertAction)
    }
}

// MARK: - Preview

struct TextLinkComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextLinkComponentView()
    }
}
