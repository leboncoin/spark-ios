//
//  LayoutViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

final class LayoutViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var spacingItemViewModels = [LayoutSpacingItemViewModel]()

    var theme: (any Theme)? {
        didSet {
            self.updateSpacingItemViewModels()
        }
    }

    // MARK: - Methods

    private func updateSpacingItemViewModels() {
        guard let layout = self.theme?.layout else {
            return
        }

        self.spacingItemViewModels = [
            .init(name: "none", value: layout.spacing.none),
            .init(name: "small", value: layout.spacing.small),
            .init(name: "medium", value: layout.spacing.medium),
            .init(name: "large", value: layout.spacing.large),
            .init(name: "xLarge", value: layout.spacing.xLarge),
            .init(name: "xxLarge", value: layout.spacing.xxLarge)
        ]
    }
}
