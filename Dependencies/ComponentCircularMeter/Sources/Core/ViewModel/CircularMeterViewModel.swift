//
//  CircularMeterViewModel.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class CircularMeterViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = CircularMeterColors()
    @Published private(set) var sizes = CircularMeterSizes()
    @Published private(set) var typographies = CircularMeterTypographies()
    @Published private(set) var layout = CircularMeterLayout()
    @Published private(set) var isInsideContent = false

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setTypographies()
            self.setLayout()
        }
    }

    var intent: CircularMeterIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var size: CircularMeterSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setSizes()
            self.setTypographies()
            self.setIsInsideContent()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any CircularMeterGetColorsUseCaseable
    private let getSizesUseCase: any CircularMeterGetSizesUseCaseable
    private let getTypographiesUseCase: any CircularMeterGetTypographiesUseCaseable
    private let getLayoutUseCase: any CircularMeterGetLayoutUseCaseable
    private let getIsInsideContentUseCase: any CircularMeterGetIsInsideContentUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any CircularMeterGetColorsUseCaseable = CircularMeterGetColorsUseCase(),
        getSizesUseCase: any CircularMeterGetSizesUseCaseable = CircularMeterGetSizesUseCase(),
        getTypographiesUseCase: any CircularMeterGetTypographiesUseCaseable = CircularMeterGetTypographiesUseCase(),
        getLayoutUseCase: any CircularMeterGetLayoutUseCaseable = CircularMeterGetLayoutUseCase(),
        getIsInsideContentUseCase: any CircularMeterGetIsInsideContentUseCaseable = CircularMeterGetIsInsideContentUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getSizesUseCase = getSizesUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getIsInsideContentUseCase = getIsInsideContentUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: CircularMeterIntent,
        size: CircularMeterSize
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size

        self.setColors()
        self.setSizes()
        self.setTypographies()
        self.setLayout()
        self.setIsInsideContent()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme, let intent else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
    }

    private func setSizes() {
        guard let size else { return }

        self.sizes = self.getSizesUseCase.execute(
            size: size
        )
    }

    private func setTypographies() {
        guard let theme, let size else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme,
            size: size
        )
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme
        )
    }

    private func setIsInsideContent() {
        guard let size else { return }

        self.isInsideContent = self.getIsInsideContentUseCase.execute(
            size: size
        )
    }
}
