//
//  TypographyView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct TypographyView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @ObservedObject private var viewModel = TypographyViewModel()

    // MARK: - View

    var body: some View {
        List {
            ForEach(self.viewModel.itemViewModels, id: \.self) { itemViewModels in
                Section {
                    ForEach(itemViewModels, id: \.self) { itemViewModel in
                        TypographyItemView(viewModel: itemViewModel)
                    }
                }
            }

            NavigationLink("Custom", value: Redirection.custom)
        }
        .navigationDestination(for: Redirection.self, destination: { _ in
            TypographyCustomView()
                .sparkTheme(self.theme.value)
        })
        .onChange(of: self.theme, initial: true) {
            self.viewModel.theme = self.theme.value
        }
        .navigationBarTitle("Typography")
    }
}

private enum Redirection: String, CaseIterable, Hashable {
    case custom
}
