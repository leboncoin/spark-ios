//
//  ColorView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @ObservedObject private var viewModel = ColorViewModel()

    // MARK: - View

    var body: some View {
        List(self.viewModel.sectionViewModels, id: \.name) { sectionViewModel in
            NavigationLink(sectionViewModel.name) {
                ColorSectionView(viewModel: sectionViewModel)
            }
        }
        .onChange(of: self.theme, initial: true) {
            self.viewModel.theme = self.theme.value
        }
        .navigationBarTitle("Color")
    }
}
