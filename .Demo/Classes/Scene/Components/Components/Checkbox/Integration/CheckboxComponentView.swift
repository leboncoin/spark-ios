//
//  CheckboxComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CheckboxComponentView = ComponentViewable<CheckboxConfiguration, CheckboxImplementationView, CheckboxConfigurationView>

// MARK: - Subview

struct CheckboxImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxConfiguration>
    @State private var selectionState: CheckboxSelectionState = .unselected

    // MARK: - View

    var body: some View {
        VStack {
            CheckboxView(
                text: self.configurationWrapped.text,
                checkedImage: .init(icon: self.configurationWrapped.checkedIcon),
                alignment: self.configurationWrapped.alignment,
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                selectionState: self.configurationWrapped.isIndeterminate ? .constant(.indeterminate) : self.$selectionState
            )
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)

            Text(self.configurationWrapped.getInfoValue(from: self.selectionState))
                .demoComponentInfoBackground()
        }
    }
}

// MARK: - Preview

struct CheckboxComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxComponentView()
    }
}
