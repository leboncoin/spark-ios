//
//  RadioButtonGroupComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RadioButtonGroupComponentView = ComponentViewable<RadioButtonGroupConfiguration, RadioButtonGroupImplementationView, RadioButtonGroupConfigurationView>

extension RadioButtonGroupComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RadioButtonGroupImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonGroupConfiguration>
    var showInfo: Bool = true
    @State private var selectedID: Int? = Bool.random() ? 1 : nil

    // MARK: - Initialization

    init(configuration: Binding<RadioButtonGroupConfiguration>) {
        self.configuration = configuration
    }

    // Only used by the FormField demo
    init(configuration: Binding<RadioButtonGroupConfiguration>, showInfo: Bool) {
        self.configuration = configuration
        self.showInfo = showInfo
    }

    // MARK: - View

    var body: some View {
        VStack {
            RadioButtonGroupView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                selectedID: self.$selectedID,
                items: self.configurationWrapped.items.map {
                    RadioButtonItem(id: $0.id, label: $0.getText())
                },
                labelAlignment: self.configurationWrapped.labelAlignment,
                groupLayout: self.configurationWrapped.groupLayout
            )
            .demoDisabled(self.configurationWrapped)

            if self.showInfo {
                Text(self.configurationWrapped.getInfoValue(from: self.selectedID))
                .demoComponentInfoBackground()
            }
        }
    }
}

// MARK: - Preview

struct RadioButtonGroupComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroupComponentView()
    }
}
