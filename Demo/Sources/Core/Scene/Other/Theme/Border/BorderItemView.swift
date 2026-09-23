//
//  BorderItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct BorderItemView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    let viewModel: BorderItemViewModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.viewModel.name)
            Text(self.viewModel.description)
                .font(Font.caption2)
                .italic()
                .foregroundColor(.gray)

            Color.gray
                .frame(height: self.viewModel.contentHeight)
                .sparkBorder(
                    width: self.viewModel.width,
                    radius: self.viewModel.radius,
                    isHighlighted: self.viewModel.isHighlighted,
                    colorToken: self.theme.value.colors.base.surfaceInverse
                )
        }
    }
}
