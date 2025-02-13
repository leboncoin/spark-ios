//
//  SliderComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SliderComponentView = ComponentViewable<SliderConfiguration, SliderImplementationView, SliderConfigurationView>

extension SliderComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SliderImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SliderConfiguration>
    @State private var value: Float = 0
    @State private var isEditing: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            SparkCore.Slider(
                theme: self.configurationWrapped.theme.value,
                shape: self.configurationWrapped.shape,
                intent: self.configurationWrapped.intent,
                value: self.$value,
                in: self.configurationWrapped.bounds(),
                step: self.configurationWrapped.step(),
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .onAppear() {
                self.value = Float(self.configurationWrapped.valueString) ?? 0
            }
            .onChange(of: self.configurationWrapped.valueString) { newValue in
                self.value = Float(newValue) ?? 0
            }

            HStack {
                Text(configurationWrapped.getInfoValue(from: self.value))
                Divider()
                    .infoFrame()
                Text("Is Editing: \(self.isEditing)")
            }
            .demoComponentInfoBackground()
        }
    }
}

// MARK: - Preview

struct SliderComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderComponentView()
    }
}
