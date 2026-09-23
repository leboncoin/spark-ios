//
//  DevModeView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct DevModeView: View {

    // MARK: - Properties

    var theme = DemoThemes.shared.mainTheme

    // MARK: - View

    var body: some View {
        VStack {
            Text("Replace me with your UI content")

            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    DevModeView()
}
