//
//  TextEditorComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: NOT WORKING ANYMORE on iOS 18.2

// MARK: - View

typealias TextEditorComponentView = ComponentViewable<TextEditorConfiguration, TextEditorImplementationView, TextEditorConfigurationView>

extension TextEditorComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .horizontalContent])
    }
}

// MARK: - Subview

struct TextEditorImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextEditorConfiguration>
    @State private var text: String = ""

    private var textForFormField: Binding<String>? // Only used by the FormField demo

    // MARK: - Initialization

    init(configuration: Binding<TextEditorConfiguration>) {
        self.configuration = configuration
        self.textForFormField = nil
    }

    // Only used by the FormField demo
    init(configuration: Binding<TextEditorConfiguration>, textForFormField: Binding<String>) {
        self.configuration = configuration
        self.textForFormField = textForFormField
    }

    // MARK: - View

    var body: some View {
        TextEditorView(
            self.configurationWrapped.placeholder,
            text: self.textForFormField ?? self.$text,
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent
        )
        .demoDisabled(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoFrame(self.configurationWrapped)
    }
}

// MARK: - Preview

struct TextEditorComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorComponentView()
    }
}
