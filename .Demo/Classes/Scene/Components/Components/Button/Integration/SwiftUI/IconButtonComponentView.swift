//
//  IconButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias IconButtonComponentView = ComponentViewable<IconButtonConfiguration, IconButtonImplementationView, IconButtonConfigurationView>

// MARK: - Subview

struct IconButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<IconButtonConfiguration>
    @State private var isSelected = false
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        IconButtonView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            variant: self.configurationWrapped.variant,
            size: self.configurationWrapped.size,
            shape: self.configurationWrapped.shape,
            action: {
                if self.configurationWrapped.swiftUIIsToggle {
                    self.isSelected.toggle()
                } else {
                    self.showAlertAction = true
                }
            })
        .selected(self.isSelected)
        .demoImage(self.configurationWrapped, for: .normal)
        .demoImage(self.configurationWrapped, for: .highlighted)
        .demoImage(self.configurationWrapped, for: .disabled)
        .demoImage(self.configurationWrapped, for: .selected)
        .demoDisabled(self.configurationWrapped)
        .demoBackground(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .alert("Button tap", isPresented: self.$showAlertAction) {
            Button("OK", role: .cancel) { }
        }
    }
}

// MARK: - Extension

private extension IconButtonView {

    func demoImage(
        _ configuration: IconButtonConfiguration,
        for state: ControlState
    ) -> Self {
        let content = switch state {
        case .normal: configuration.contentNormal
        case .highlighted: configuration.contentHighlighted
        case .disabled: configuration.contentDisabled
        case .selected: configuration.contentSelected
        }

        return self.image(.init(icon: content.icon), for: state)
    }
}

// MARK: - Preview

struct IconButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonComponentView()
    }
}
