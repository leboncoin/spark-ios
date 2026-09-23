//
//  TabSegmentViewModel.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class TabSegmentViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var contentColors = TabContentColors()
    @Published private(set) var fonts = TabFonts()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setContentColors()
            self.setFonts()
        }
    }

    var intent: TabIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setContentColors()
        }
    }

    var size: TabSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setFonts()
        }
    }

    var isSelected: Bool? {
        didSet {
            guard oldValue != self.isSelected, self.alreadyUpdateAll else { return }

            self.setContentColors()
            self.setFonts()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setContentColors()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getContentColorsUseCase: any TabGetContentColorsUseCaseable
    private let getFontsUseCase: any TabGetFontsUseCaseable

    // MARK: - Initialization

    init(
        getContentColorsUseCase: any TabGetContentColorsUseCaseable = TabGetContentColorsUseCase(),
        getFontsUseCase: any TabGetFontsUseCaseable = TabGetFontsUseCase()
    ) {
        self.getContentColorsUseCase = getContentColorsUseCase
        self.getFontsUseCase = getFontsUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: TabIntent,
        size: TabSize,
        isSelected: Bool,
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size
        self.isSelected = isSelected

        self.setContentColors()
        self.setFonts()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setContentColors() {
        guard let theme, let intent, let isSelected else { return }

        self.contentColors = self.getContentColorsUseCase.execute(
            theme: theme,
            intent: intent,
            isSelected: isSelected,
            isPressed: self.isPressed
        )
    }

    private func setFonts() {
        guard let theme, let size, let isSelected else { return }

        self.fonts = self.getFontsUseCase.execute(
            theme: theme,
            size: size,
            isSelected: isSelected
        )
    }
}
