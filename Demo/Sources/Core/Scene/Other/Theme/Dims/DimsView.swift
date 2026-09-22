//
//  DimsView.swift
//  SparkDemo
//
//  Created by louis.borlee on 22/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct DimsView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @ObservedObject private var viewModel = DimsViewModel()

    // MARK: - View

    var body: some View {
        List(self.viewModel.dimItemViewModels, id: \.self) {
            DimItemView(viewModel: $0)
        }
        .onChange(of: self.theme, initial: true) {
            self.viewModel.theme = self.theme.value
        }
        .navigationBarTitle("Dims")
    }
}
