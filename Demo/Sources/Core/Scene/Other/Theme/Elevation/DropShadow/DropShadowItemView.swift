//
//  DropShadowItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 04/09/2026.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct DropShadowItemView: View {

    // MARK: - Properties

    let itemViewModel: DropShadowItemViewModel
    let backgroundColor: Color

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.itemViewModel.name)
            Text(self.itemViewModel.description)
                .font(Font.caption2)
                .italic()
                .foregroundColor(.gray)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            self.backgroundColor
                .frame(height: 50)
                .cornerRadius(5)
                .shadow(self.itemViewModel.shadow)
        }
        .padding(.bottom, self.itemViewModel.bottomPadding)
    }
}
