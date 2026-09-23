//
//  LayoutView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct LayoutView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @ObservedObject private var viewModel = LayoutViewModel()

    // MARK: - View

    var body: some View {
        List(self.viewModel.spacingItemViewModels, id: \.self) {
            LayoutSpacingItemView(viewModel: $0)
        }
        .onChange(of: self.theme, initial: true) {
            self.viewModel.theme = self.theme.value
        }
        .navigationBarTitle("Layout")
    }
}
