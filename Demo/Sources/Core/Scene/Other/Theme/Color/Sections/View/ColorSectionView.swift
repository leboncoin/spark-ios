//
//  ColorSectionView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorSectionView: View {

    // MARK: - Properties

    let viewModel: any ColorSectionViewModelable

    // MARK: - View

    var body: some View {
        List(self.viewModel.itemViewModels, id: \.self) { itemViewModels in
            Section {
                ForEach(itemViewModels, id: \.self) { itemViewModel in
                    ColorItemView(viewModel: itemViewModel)
                }
            } header: {
                HStack(spacing: .medium) {
                    Text("☀️")
                        .frame(maxWidth: .infinity)
                    Text("🌚")
                        .frame(maxWidth: .infinity)
                    Text("⬛☀️")
                        .frame(maxWidth: .infinity)
                    Text("⬛🌚")
                        .frame(maxWidth: .infinity)
                }
                .font(.system(size: 24))
                .frame(height: 50)
            } footer: {
                VStack(alignment: .leading, spacing: .medium) {
                    Text("☀️ Light Mode")
                    Text("🌚 Dark Mode")
                    Text("⬛☀️ Light High Contrast")
                    Text("⬛🌚 Dark High Contrast")
                }
                .font(.footnote)
            }
        }
        .listStyle(.insetGrouped)
        .background(Color(.secondarySystemGroupedBackground))
        .navigationBarTitle(self.viewModel.name)
    }
}
