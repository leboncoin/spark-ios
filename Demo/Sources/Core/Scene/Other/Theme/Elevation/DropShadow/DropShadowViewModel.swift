//
//  DropShadowViewModel.swift
//  SparkDemo
//
//  Created by louis.borlee on 30/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

final class DropShadowViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var itemViewModels = [DropShadowItemViewModel]()

    var theme: (any Theme)? {
        didSet {
            self.updateItemViewModels()
        }
    }

    // MARK: - Methods

    private func updateItemViewModels() {
        guard let dropShadow = self.theme?.elevation.dropShadow else {
            return
        }

        self.itemViewModels = [
            .init(name: "none", shadow: dropShadow.none, bottomPadding: .xSmall),
            .init(name: "small", shadow: dropShadow.small, bottomPadding: .small),
            .init(name: "default", shadow: dropShadow, bottomPadding: .small),
            .init(name: "medium", shadow: dropShadow.medium, bottomPadding: .medium),
            .init(name: "large", shadow: dropShadow.large, bottomPadding: .large),
            .init(name: "extraLarge", shadow: dropShadow.extraLarge, bottomPadding: .xLarge)
        ]
    }
}
