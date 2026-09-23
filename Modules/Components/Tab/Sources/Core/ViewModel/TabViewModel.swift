//
//  TabViewModel.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class TabViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var linesColors = TabLinesColors()
    @Published private(set) var accessibilityColors = TabAccessibilityColors()
    @Published private(set) var sizes = TabSizes()
    @Published private(set) var layout = TabLayout()
    @Published private(set) var dim: CGFloat = .zero

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setLinesColors()
            self.setAccessibilityColors()
            self.setLayout()
            self.setSizes()
            self.setDim()
        }
    }

    var intent: TabIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setLinesColors()
            self.setAccessibilityColors()
        }
    }

    var size: TabSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setSizes()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getLinesColorsUseCase: any TabGetLinesColorsUseCaseable
    private let getAccessibilityColorsUseCase: any TabAccessibilityColorsUseCaseable
    private let getLayoutUseCase: any TabGetLayoutUseCaseable
    private let getSizesUseCase: any TabGetSizesUseCaseable
    private let getDimUseCase: any TabGetDimUseCaseable

    // MARK: - Initialization

    init(
        getLinesColorsUseCase: any TabGetLinesColorsUseCaseable = TabGetLinesColorsUseCase(),
        getAccessibilityColorsUseCase: any TabAccessibilityColorsUseCaseable = TabAccessibilityColorsUseCase(),
        getLayoutUseCase: any TabGetLayoutUseCaseable = TabGetLayoutUseCase(),
        getSizesUseCase: any TabGetSizesUseCaseable = TabGetSizesUseCase(),
        getDimUseCase: any TabGetDimUseCaseable = TabGetDimUseCase()
    ) {
        self.getLinesColorsUseCase = getLinesColorsUseCase
        self.getAccessibilityColorsUseCase = getAccessibilityColorsUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getSizesUseCase = getSizesUseCase
        self.getDimUseCase = getDimUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: TabIntent,
        size: TabSize,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size
        self.isEnabled = isEnabled

        self.setLinesColors()
        self.setAccessibilityColors()
        self.setLayout()
        self.setSizes()
        self.setDim()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setLinesColors() {
        guard let theme, let intent else { return }

        self.linesColors = self.getLinesColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
    }

    private func setAccessibilityColors() {
        guard let theme, let intent else { return }

        self.accessibilityColors = self.getAccessibilityColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme
        )
    }

    private func setSizes() {
        guard let theme, let size else { return }

        self.sizes = self.getSizesUseCase.execute(
            theme: theme,
            size: size
        )
    }

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }
}
