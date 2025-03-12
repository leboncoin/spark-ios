//
//  SwitchComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: To fix :
// - the space when the aligment is equals to right : the max width infinit didn't work
// - add/update the accessibility (read everything or add two func to set child accessibility properties)

// MARK: - View

typealias SwitchComponentView = ComponentViewable<SwitchConfiguration, SwitchImplementationView, SwitchConfigurationView>

extension SwitchComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SwitchImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SwitchConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        SwitchView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            alignment: self.configurationWrapped.alignment,
            isOn: self.$isOn
        )
        .demoImages(self.configurationWrapped)
        .demoText(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityValue(self.configurationWrapped)
        .demoDisabled(self.configurationWrapped)
        .demoFrame(self.configurationWrapped)
    }
}

// MARK: - Extension

private extension SwitchView {

    func demoImages(_ configuration: SwitchConfiguration) -> Self {
        if configuration.hasImages {
            return self.images(.init(
                on: .init(icon: Iconography.check),
                off: .init(icon: Iconography.cross)
            ))
        } else {
            return self.images(nil)
        }
    }

    func demoText(_ configuration: SwitchConfiguration) -> Self {
        let text = configuration.text
        if text.isEmpty {
            return self.text(nil)
        } else if configuration.isAttributedText {
            return self.attributedText(text.demoAttributedString)
        } else {
            return self.text(text)
        }
    }
}

// MARK: - Preview

struct SwitchComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchComponentView()
    }
}
