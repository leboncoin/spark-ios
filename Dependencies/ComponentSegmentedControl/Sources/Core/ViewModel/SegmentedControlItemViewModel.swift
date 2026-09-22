//
//  SegmentedControlItemViewModel.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class SegmentedControlItemViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = SegmentedControlItemColors()
    @Published private(set) var typographies = SegmentedControlItemTypographies()
    @Published private(set) var layout = SegmentedControlItemLayout()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setTypographies()
            self.setLayout()
        }
    }

    var isSelected: Bool? {
        didSet {
            guard oldValue != self.isSelected, self.alreadyUpdateAll else { return }

            self.setTypographies()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any SegmentedControlGetItemColorsUseCaseable
    private let getTypographiesUseCase: any SegmentedControlGetItemTypographiesUseCaseable
    private let getLayoutUseCase: any SegmentedControlGetItemLayoutUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any SegmentedControlGetItemColorsUseCaseable = SegmentedControlGetItemColorsUseCase(),
        getTypographiesUseCase: any SegmentedControlGetItemTypographiesUseCaseable = SegmentedControlGetItemTypographiesUseCase(),
        getLayoutUseCase: any SegmentedControlGetItemLayoutUseCaseable = SegmentedControlGetItemLayoutUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
        self.getLayoutUseCase = getLayoutUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        isSelected: Bool,
        isPressed: Bool
    ) {
        self.theme = theme
        self.isSelected = isSelected
        self.isPressed = isPressed
        self.isSelected = isSelected

        self.setColors()
        self.setTypographies()
        self.setLayout()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme, let isSelected else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            isPressed: self.isPressed,
            isSelected: isSelected
        )
    }

    private func setTypographies() {
        guard let theme, let isSelected else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme,
            isSelected: isSelected
        )
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(theme: theme)
    }
}
