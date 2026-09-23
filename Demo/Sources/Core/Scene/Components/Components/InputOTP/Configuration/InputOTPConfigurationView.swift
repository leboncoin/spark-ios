//
//  InputOTPConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentInputOTP

struct InputOTPConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = InputOTPConfiguration
    typealias ComponentUIView = UIView

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable?

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    ) {
        self.configuration = configuration
        self.componentImplementationViewRepresentable = componentImplementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            framework: self.framework,
            componentView: {
                InputOTPImplementationView(configuration: self.configuration)
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "digits",
                    values: InputOTPDigits.allCases,
                    selectedValue: self.configuration.digits
                )

                EnumConfigurationItemView(
                    name: "code type",
                    values: InputOTPCodeType.allCases,
                    selectedValue: self.configuration.codeType
                )

                ToggleConfigurationItemView(
                    name: "on error",
                    isOn: self.configuration.onError
                )

                ToggleConfigurationItemView(
                    name: "is completion",
                    isOn: self.configuration.isCompletion
                )
            }
        )
    }
}
