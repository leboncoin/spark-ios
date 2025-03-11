//
//  ConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ConfigurationItemView<Item: View>: View {

    // MARK: - Properties

    let name: String?
    let spacing: Spacing
    let orientation: Orientation
    var item: () -> Item

    // MARK: - Initialization

    init(
        name: String?,
        spacing: Spacing = .none,
        orientation: Orientation = .horizontal,
        @ViewBuilder item: @escaping () -> Item
    ) {
        self.item = item
        self.spacing = spacing
        self.orientation = orientation
        self.name = name
    }

    // MARK: - View

    var body: some View {
        self.stack {
            if let name {
                Text("\(name.capitalized)").bold()
            }

            if self.orientation.isSpacer {
                Spacer()
            }

            self.item()
        }
    }

    @ViewBuilder
    private func stack(@ViewBuilder _ content: @escaping () -> some View) -> some View {
        switch self.orientation {
        case .horizontal:
            HStack(alignment: .center, spacing: self.spacing, content: content)

        case .vertical:
            VStack(alignment: .leading, spacing: self.spacing, content: content)
        }
    }
}

// MARK: - Extension

private extension Orientation {

    var isSpacer: Bool {
        self == .horizontal
    }
}

#Preview {
    ConfigurationItemView(name: "Name", item: {
        Text("Your name")
    })
}
