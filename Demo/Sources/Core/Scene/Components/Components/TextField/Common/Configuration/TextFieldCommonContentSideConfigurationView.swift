//
//  TextFieldCommonContentSideConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

struct TextFieldCommonContentSideConfigurationView<Configuration: TextFieldConfiguration>: View {

    // MARK: - Properties

    let id: UUID = UUID()
    let configuration: Binding<Configuration>
    let framework: Framework

    // MARK: - View

    var body: some View {
        // Left & Right View
        ForEach(TextFieldContentSide.allCases, id: \.self) { contentSide in
            let contentType = switch contentSide {
            case .left: self.configuration.leftViewContentType
            case .right: self.configuration.rightViewContentType
            }

            let mode = switch contentSide {
            case .left: self.configuration.uiKitLeftViewMode
            case .right: self.configuration.uiKitRightViewMode
            }

            Section("\(contentSide.name) View") {
                EnumConfigurationItemView(
                    name: "\(contentSide.name) view",
                    values: TextFieldSideViewContentType.allCases,
                    selectedValue: contentType
                )

                if self.framework.isUIKit {
                    EnumConfigurationItemView(
                        name: "\(contentSide.name) view mode",
                        values: UITextField.ViewMode.allCases,
                        selectedValue: mode
                    )
                }
            }
        }

        // Left & Right Addons
        if self.framework.isSwiftUI {
            ForEach(TextFieldContentSide.allCases, id: \.self) { contentSide in
                let contentType = switch contentSide {
                case .left: self.configuration.leftAddonContentType
                case .right: self.configuration.rightAddonContentType
                }

                let isPadding = switch contentSide {
                case .left: self.configuration.isLeftAddonPadding
                case .right: self.configuration.isRightAddonPadding
                }

                let isSeparator = switch contentSide {
                case .left: self.configuration.isLeftAddonSeparator
                case .right: self.configuration.isRightAddonSeparator
                }

                Section("\(contentSide.name) Addon") {
                    EnumConfigurationItemView(
                        name: "\(contentSide.name) view",
                        values: TextFieldSideViewContentType.allCases,
                        selectedValue: contentType
                    )

                    ToggleConfigurationItemView(
                        name: "is padding",
                        isOn: isPadding
                    )

                    ToggleConfigurationItemView(
                        name: "is separator",
                        isOn: isSeparator
                    )
                }
            }
        }
    }
}
