//
//  RadioButtonViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
final internal class RadioButtonViewModel: CommonViewModel {

    // MARK: - Published Properties

    @Published private(set) var dynamicColors = RadioButtonDynamicColors()
    @Published private(set) var staticColors = RadioButtonStaticColors()

    // MARK: - Properties

    private var alreadyUpdateAll = false

    override var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    var intent: RadioButtonIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    var isSelected: Bool? {
        didSet {
            guard oldValue != self.isSelected, self.alreadyUpdateAll else { return }

            self.setDynamicColors()
        }
    }

    // MARK: - Use Case Properties

    private let getColorsUseCase: any RadioButtonGetColorsUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any RadioButtonGetColorsUseCaseable = RadioButtonGetColorsUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase

        super.init(type: .radioButton)
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: RadioButtonIntent,
        isSelected: Bool,
        isEnabled: Bool,
        isCustomLabel: Bool
    ) {
        self.intent = intent
        self.isSelected = isSelected

        self.setup(
            theme: theme,
            isEnabled: isEnabled,
            isCustomLabel: isCustomLabel
        )

        self.setDynamicColors()
        self.setStaticColors()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setDynamicColors() {
        guard let theme, let intent, let isSelected else {
            return
        }

        self.dynamicColors = self.getColorsUseCase.executeDynamic(
            theme: theme,
            intent: intent,
            isOn: isSelected
        )
    }

    private func setStaticColors() {
        guard let theme, let intent else {
            return
        }

        self.staticColors = self.getColorsUseCase.executeStatic(
            theme: theme,
            intent: intent
        )
    }
}
