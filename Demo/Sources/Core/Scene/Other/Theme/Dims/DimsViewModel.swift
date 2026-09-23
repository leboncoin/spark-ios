//
//  DimsViewModel.swift
//  SparkDemo
//
//  Created by louis.borlee on 22/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

final class DimsViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var dimItemViewModels = [DimItemViewModel]()

    var theme: (any Theme)? {
        didSet {
            self.updateDimItemViewModels()
        }
    }

    // MARK: - Methods

    private func updateDimItemViewModels() {
        guard let theme = self.theme else {
            return
        }

        self.dimItemViewModels = [
            .init(name: "none", value: theme.dims.none),
            .init(name: "dim1", value: theme.dims.dim1),
            .init(name: "dim2", value: theme.dims.dim2),
            .init(name: "dim3", value: theme.dims.dim3),
            .init(name: "dim4", value: theme.dims.dim4),
            .init(name: "dim5", value: theme.dims.dim5),
            .init(name: "full", value: theme.dims.full),
        ]
    }
}
