//
//  BorderView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct BorderView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @ObservedObject private var viewModel = BorderViewModel()

    // MARK: - View

    var body: some View {
        List(self.viewModel.sectionViewModels, id: \.self) { sectionViewModel in
            Section(header: Text(sectionViewModel.name)) {
                ForEach(sectionViewModel.itemViewModels, id: \.self) { itemViewModel in
                    BorderItemView(viewModel: itemViewModel)
                }
            }
        }
        .onChange(of: self.theme, initial: true) {
            self.viewModel.theme = self.theme.value
        }
        .navigationBarTitle("Border")
    }
}
