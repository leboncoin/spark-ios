//
//  ColorViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

final class ColorViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var sectionViewModels = [any ColorSectionViewModelable]()

    var theme: (any Theme)? {
        didSet {
            self.updateSectionViewModels()
        }
    }

    // MARK: - Methods

    private func updateSectionViewModels() {
        guard let theme = self.theme else {
            return
        }
        self.sectionViewModels = ColorSectionType.allCases.map { $0.viewModel(theme: theme) }
    }
}
