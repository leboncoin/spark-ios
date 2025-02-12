//
//  BottomSheetConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct BottomSheetConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<BottomSheetConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: BottomSheetImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "content",
                    values: BottomSheetContentType.allCases,
                    selectedValue: self.configuration.contentType
                )
            }
        )
    }
}
