//
//  TextFieldCommonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TextFieldCommonConfigurationView<Configuration: TextFieldConfiguration>: View {

    // MARK: - Properties

    let configuration: Binding<Configuration>

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

        ToggleConfigurationView(
            name: "is read only",
            isOn: self.configuration.isReadOnly
        )

        EnumConfigurationView(
            name: "left view",
            values: TextFieldSideViewContentType.allCases,
            selectedValue: self.configuration.leftViewContentType
        )

        EnumConfigurationView(
            name: "right view",
            values: TextFieldSideViewContentType.allCases,
            selectedValue: self.configuration.rightViewContentType
        )
    }
}
