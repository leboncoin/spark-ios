//
//  SegmentedControlViewModel.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class SegmentedControlViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = SegmentedControlColors()
    @Published private(set) var border = SegmentedControlBorder()
    @Published private(set) var layout = SegmentedControlLayout()
    @Published private(set) var dim: CGFloat = .zero

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
            self.setLayout()
            self.setDim()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any SegmentedControlGetColorsUseCaseable
    private let getBorderUseCase: any SegmentedControlGetBorderUseCaseable
    private let getLayoutUseCase: any SegmentedControlGetLayoutUseCaseable
    private let getDimUseCase: any SegmentedControlGetDimUseCaseable
    private let getDisplayTagsUseCase: any SegmentedControlGetDisplayTagsUseCaseable
    private let getIsVerticalSeparatorUseCase: any SegmentedControlGetIsVerticalSeparatorUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any SegmentedControlGetColorsUseCaseable = SegmentedControlGetColorsUseCase(),
        getBorderUseCase: any SegmentedControlGetBorderUseCaseable = SegmentedControlGetBorderUseCase(),
        getLayoutUseCase: any SegmentedControlGetLayoutUseCaseable = SegmentedControlGetLayoutUseCase(),
        getDimUseCase: any SegmentedControlGetDimUseCaseable = SegmentedControlGetDimUseCase(),
        getDisplayTagsUseCase: any SegmentedControlGetDisplayTagsUseCaseable = SegmentedControlGetDisplayTagsUseCase(),
        getIsVerticalSeparatorUseCase: any SegmentedControlGetIsVerticalSeparatorUseCaseable = SegmentedControlGetIsVerticalSeparatorUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getBorderUseCase = getBorderUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getDimUseCase = getDimUseCase
        self.getDisplayTagsUseCase = getDisplayTagsUseCase
        self.getIsVerticalSeparatorUseCase = getIsVerticalSeparatorUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.isEnabled = isEnabled

        self.setColors()
        self.setBorder()
        self.setLayout()
        self.setDim()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme else { return }

        self.colors = self.getColorsUseCase.execute(theme: theme)
    }

    private func setBorder() {
        guard let theme else { return }

        self.border = self.getBorderUseCase.execute(theme: theme)
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(theme: theme)
    }

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    // MARK: - Getter

    func getDisplayTags(from tags: [AnyHashable]) -> [[AnyHashable]] {
        return self.getDisplayTagsUseCase.execute(tags: tags)
    }

    func getIsVerticalSeparator(
        tags: Int,
        horizontalTags: Int,
        columnIndex: Int
    ) -> Bool {
        return self.getIsVerticalSeparatorUseCase.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )
    }
}
