//
//  RadioButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RadioButtonComponentView = ComponentViewable<RadioButtonConfiguration, RadioButtonImplementationView, RadioButtonConfigurationView>

extension RadioButtonComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RadioButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonConfiguration>
    var showInfo: Bool = true
    @State private var selectedID: Int? = Bool.random() ? 1 : nil

    // MARK: - Initialization

    init(configuration: Binding<RadioButtonConfiguration>) {
        self.configuration = configuration
    }

    // Only used by the FormField demo
    init(configuration: Binding<RadioButtonConfiguration>, showInfo: Bool) {
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
                    RadioButtonItem(id: $0.id, label: $0.text)
                },
                labelAlignment: self.configurationWrapped.labelAlignment,
                groupLayout: self.configurationWrapped.groupLayout
            )
            .demoDisabled(self.configurationWrapped)

            if self.showInfo {
                Group {
                    if let selectedID {
                        Text("SelectedID: \(selectedID)")
                    } else {
                        Text("No selection")
                    }
                }
                .demoComponentInfoBackground()
            }
        }
    }
}

// MARK: - Preview

struct RadioButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonComponentView()
    }
}
