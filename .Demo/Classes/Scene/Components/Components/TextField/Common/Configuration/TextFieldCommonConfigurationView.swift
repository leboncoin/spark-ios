//
//  TextFieldCommonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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
        EnumConfigurationView(
            name: "intent",
            values: TextFieldIntent.allCases,
            selectedValue: self.configuration.intent
        )

        TextFieldConfigurationView(
            name: "placeholder",
            text: self.configuration.placeholder
        )

        ToggleConfigurationView(
            name: "is secure",
            isOn: self.configuration.isSecure
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationView(
                name: "is read only",
                isOn: self.configuration.swiftUIIsReadOnly
            )
        }

        if self.framework.isUIKit {
            EnumConfigurationView(
                name: "clear button mode",
                values: UITextField.ViewMode.allCases,
                selectedValue: self.configuration.uiKitClearButtonMode
            )

            ToggleConfigurationView(
                name: "is user interaction enabled",
                isOn: self.configuration.uiKitIsUserInteractionEnabled
            )
        }
    }
}
