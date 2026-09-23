//
//  TextFieldCommonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

struct TextFieldCommonConfigurationView<Configuration: TextFieldConfiguration>: View {

    // MARK: - Properties

    let id: UUID = UUID()
    let configuration: Binding<Configuration>
    let framework: Framework

    // MARK: - View

    var body: some View {
        EnumConfigurationItemView(
            name: "intent",
            values: TextFieldIntent.allCases,
            selectedValue: self.configuration.intent
        )

        if self.framework.isSwiftUI {
            EnumConfigurationItemView(
                name: "content type",
                values: TextFieldContentType.allCases,
                selectedValue: self.configuration.swiftUIContentType
            )
        }

        TextFieldConfigurationItemView(
            name: "placeholder",
            text: self.configuration.placeholder
        )

        ToggleConfigurationItemView(
            name: "is secure",
            isOn: self.configuration.isSecure
        )

        ToggleConfigurationItemView(
            name: "is read only",
            isOn: self.configuration.isReadOnly
        )

        if self.framework.isUIKit {
            EnumConfigurationItemView(
                name: "clear button mode",
                values: UITextField.ViewMode.allCases,
                selectedValue: self.configuration.uiKitClearButtonMode
            )
        } else {
            EnumConfigurationItemView(
                name: "clear button mode",
                values: TextFieldClearMode.allCases,
                selectedValue: self.configuration.swiftUIClearButtonMode
            )
        }
    }
}
