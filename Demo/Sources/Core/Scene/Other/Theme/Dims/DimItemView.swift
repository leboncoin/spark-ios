//
//  DimItemView.swift
//  SparkDemo
//
//  Created by louis.borlee on 22/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct DimItemView: View {

    // MARK: - Properties

    let viewModel: DimItemViewModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.viewModel.name)
            Text(self.viewModel.description)
                .font(Font.caption2)
                .italic()
                .foregroundColor(.gray)

            Rectangle()
                .fill(.gray)
                .frame(height: 50)
                .opacity(viewModel.value)
        }
    }
}
