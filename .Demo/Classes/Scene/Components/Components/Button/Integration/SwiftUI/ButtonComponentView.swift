//
//  ButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ButtonComponentView = ComponentViewable<ButtonConfiguration, ButtonImplementationView, ButtonConfigurationView>

// MARK: - Subview

struct ButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ButtonConfiguration>
    @State private var isSelected = false
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        ButtonView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            variant: self.configurationWrapped.variant,
            size: self.configurationWrapped.size,
            shape: self.configurationWrapped.shape,
            alignment: self.configurationWrapped.alignment,
            action: {
                if self.configurationWrapped.swiftUIIsToggle {
                    self.isSelected.toggle()
                } else {
                    self.showAlertAction = true
                }
            })
        .disabled(!self.configurationWrapped.isEnabled.value)
        .selected(self.isSelected)
        .frame(maxWidth: self.configurationWrapped.swiftUIIsFullWidth ? .infinity : nil)
        .demoImage(self.configurationWrapped, for: .normal)
        .demoImage(self.configurationWrapped, for: .highlighted)
        .demoImage(self.configurationWrapped, for: .disabled)
        .demoImage(self.configurationWrapped, for: .selected)
        .demoTitle(self.configurationWrapped, for: .normal)
        .demoTitle(self.configurationWrapped, for: .highlighted)
        .demoTitle(self.configurationWrapped, for: .disabled)
        .demoTitle(self.configurationWrapped, for: .selected)
        .demoBackground(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .alert("Button tap", isPresented: self.$showAlertAction) {
            Button("OK", role: .cancel) { }
        }
    }
}

// MARK: - Extension

private extension ButtonView {

    func demoImage(
        _ configuration: ButtonConfiguration,
        for state: ControlState
    ) -> Self {
        let content = self.content(configuration, for: state)
        return self.image(.init(icon: content.icon), for: state)
    }

    func demoTitle(
        _ configuration: ButtonConfiguration,
        for state: ControlState
    ) -> Self {
        let content = self.content(configuration, for: state)

        guard !content.title.isEmpty else {
            return self.title(nil, for: state)
        }

        if content.isAttributedTitle {
            return self.attributedTitle(
                content.title.demoAttributedString,
                for: state
            )
        } else {
            return self.title(content.title, for: state)
        }
    }

    private func content(
        _ configuration: ButtonConfiguration,
        for state: ControlState
    ) -> ButtonConfiguration.Content {
        return switch state {
        case .normal: configuration.contentNormal
        case .highlighted: configuration.contentHighlighted
        case .disabled: configuration.contentDisabled
        case .selected: configuration.contentSelected
        }
    }
}

// MARK: - Preview

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponentView()
    }
}
