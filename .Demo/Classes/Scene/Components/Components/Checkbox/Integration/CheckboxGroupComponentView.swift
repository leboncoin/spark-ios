//
//  CheckboxGroupComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: Fix (or maybe a demo bug)
// - when layout changed, sometime the view is clear completly ! (seems to work correctly when the default layous is horizontal)

// MARK: - View

typealias CheckboxGroupComponentView = ComponentViewable<CheckboxGroupConfiguration, CheckboxGroupImplementationView, CheckboxGroupConfigurationView>

extension CheckboxGroupComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct CheckboxGroupImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxGroupConfiguration>
    var showInfo: Bool = true
    @State private var items = [any CheckboxGroupItemProtocol]()

    // MARK: - Initialization

    init(configuration: Binding<CheckboxGroupConfiguration>) {
        self.configuration = configuration
    }

    // Only used by the FormField demo
    init(configuration: Binding<CheckboxGroupConfiguration>, showInfo: Bool) {
        self.configuration = configuration
        self.showInfo = showInfo
    }

    // MARK: - View

    var body: some View {
        VStack {
            CheckboxGroupView(
                title: self.configurationWrapped.title.isEmpty ? nil : self.configurationWrapped.title,
                checkedImage: .init(icon: self.configurationWrapped.checkedIcon),
                items: self.$items,
                layout: self.configurationWrapped.layout,
                alignment: self.configurationWrapped.alignment,
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent
            )
            .demoDisabled(self.configurationWrapped)
            .onAppear() {
                self.items = self.configurationWrapped.items.map {
                    $0.toSpark(for: .swiftUI)
                }
            }
            .onChange(of: self.configurationWrapped.items) { items in
                self.items = items.map { $0.toSpark(for: .swiftUI) }
            }

            if self.showInfo {
                Text(self.selectedItemsText())
                    .demoComponentInfoBackground()
            }
        }
    }

    // MARK: - Getter

    func selectedItemsText() -> String {
        return self.configurationWrapped.getInfoValue(from: self.items.map(\.selectionState))
    }
}

// MARK: - Preview

struct CheckboxGroupComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxGroupComponentView()
    }
}
