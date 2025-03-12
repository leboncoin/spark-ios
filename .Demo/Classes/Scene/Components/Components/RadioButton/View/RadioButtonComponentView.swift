//
//  RadioButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RadioButtonComponentView = ComponentViewable<RadioButtonConfiguration, RadioButtonImplementationView, RadioButtonConfigurationView>

// MARK: - Subview

struct RadioButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonConfiguration>
    @State private var selectedID: Int? = Bool.random() ? 1 : nil

    // MARK: - View

    var body: some View {
        VStack {
            RadioButtonView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                id: 1,
                label: self.configurationWrapped.text,
                selectedID: self.$selectedID,
                labelAlignment: self.configurationWrapped.labelAlignment
            )
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)

            Text(self.configurationWrapped.getInfoValue(from: self.selectedID))
                .demoComponentInfoBackground()
        }
    }
}

// MARK: - Preview

struct RadioButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonComponentView()
    }
}
