//
//  ToggleViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
final internal class ToggleViewModel: CommonViewModel {

    // MARK: - Published Properties

    @Published private(set) var dynamicColors = ToggleDynamicColors()
    @Published private(set) var staticColors = ToggleStaticColors()
    @Published private(set) var isIcon: Bool = false

    // MARK: - Properties

    private var alreadyUpdateAll = false

    override var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    var isOn: Bool? {
        didSet {
            guard oldValue != self.isOn, self.alreadyUpdateAll else { return }

            self.setDynamicColors()
        }
    }

    var isOnOffSwitchLabelsEnabled: Bool? {
        didSet {
            guard oldValue != self.isOnOffSwitchLabelsEnabled, self.alreadyUpdateAll else { return }

            self.setIsIcon()
        }
    }

    var contrast: ColorSchemeContrast? {
        didSet {
            guard oldValue != self.contrast, self.alreadyUpdateAll else { return }

            self.setIsIcon()
        }
    }

    // MARK: - Use Case Properties

    private let getColorsUseCase: any ToggleGetColorsUseCaseable
    private let getIsIconUseCase: any ToggleGetIsIconUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any ToggleGetColorsUseCaseable = ToggleGetColorsUseCase(),
        getIsIconUseCase: any ToggleGetIsIconUseCaseable = ToggleGetIsIconUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getIsIconUseCase = getIsIconUseCase

        super.init(type: .toggle)
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        isOn: Bool,
        isOnOffSwitchLabelsEnabled: Bool,
        contrast: ColorSchemeContrast,
        isEnabled: Bool,
        isCustomLabel: Bool
    ) {
        self.isOn = isOn
        self.isOnOffSwitchLabelsEnabled = isOnOffSwitchLabelsEnabled
        self.contrast = contrast

        self.setup(
            theme: theme,
            isEnabled: isEnabled,
            isCustomLabel: isCustomLabel
        )

        self.setDynamicColors()
        self.setStaticColors()
        self.setIsIcon()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setDynamicColors() {
        guard let theme, let isOn else {
            return
        }

        self.dynamicColors = self.getColorsUseCase.executeDynamic(
            theme: theme,
            isOn: isOn
        )
    }

    private func setStaticColors() {
        guard let theme else {
            return
        }

        self.staticColors = self.getColorsUseCase.executeStatic(theme: theme)
    }

    private func setIsIcon() {
        guard let isOnOffSwitchLabelsEnabled, let contrast else {
            return
        }

        self.isIcon = self.getIsIconUseCase.execute(
            isOnOffSwitchLabelsEnabled: isOnOffSwitchLabelsEnabled,
            contrast: contrast
        )
    }
}
