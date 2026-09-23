//
//  ToggleUIViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **UIKit** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
final internal class ToggleUIViewModel: CommonUIViewModel<ToggleCompletedAnimation, Bool> {

    // MARK: - Published Properties

    @Published private(set) var dynamicColors = ToggleDynamicColors()
    @Published private(set) var staticColors = ToggleStaticColors()
    @Published private(set) var isIcon: Bool = false
    @Published private(set) var showSpace: ToggleSpace = .left

    // MARK: - Properties

    private var alreadyUpdateAll = false

    override var theme: any Theme {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    var isOnOffSwitchLabelsEnabled: Bool = false {
        didSet {
            guard oldValue != self.isOnOffSwitchLabelsEnabled, self.alreadyUpdateAll else { return }

            self.setIsIcon()
        }
    }

    var contrast: UIAccessibilityContrast = .unspecified {
        didSet {
            guard oldValue != self.contrast, self.alreadyUpdateAll else { return }

            self.setIsIcon()
        }
    }

    // MARK: - Use Case Properties

    private let getColorsUseCase: any ToggleGetColorsUseCaseable
    private let getIsIconUseCase: any ToggleGetIsIconUseCaseable
    private let getShowSpaceUseCase: any ToggleGetShowSpaceUseCaseable

    // MARK: - Initialization

    init(
        theme: any Theme,
        getColorsUseCase: any ToggleGetColorsUseCaseable = ToggleGetColorsUseCase(),
        getIsIconUseCase: any ToggleGetIsIconUseCaseable = ToggleGetIsIconUseCase(),
        getShowSpaceUseCase: any ToggleGetShowSpaceUseCaseable = ToggleGetShowSpaceUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getIsIconUseCase = getIsIconUseCase
        self.getShowSpaceUseCase = getShowSpaceUseCase

        super.init(
            type: .toggle,
            theme: theme,
            selectedValue: false // Default value
        )
    }

    // MARK: - Load

    func load(
        isOnOffSwitchLabelsEnabled: Bool,
        isReduceMotionEnabled: Bool,
        contrast: UIAccessibilityContrast
    ) {
        self.isOnOffSwitchLabelsEnabled = isOnOffSwitchLabelsEnabled
        self.contrast = contrast

        self.load(isReduceMotionEnabled: isReduceMotionEnabled)

        self.setDynamicColors()
        self.setStaticColors()
        self.setIsIcon()
        self.setShowSpace()

        self.alreadyUpdateAll = true
    }

    // MARK: - Action

    func toggle() {
        if self.isEnabled {
            self.setSelectedValue(!self.selectedValue, animated: true)
        }
    }

    // MARK: - Update

    override func selectedValueChanged(oldValue: Bool) {
        guard oldValue != self.selectedValue, self.alreadyUpdateAll else { return }

        self.setDynamicColors()
        self.setShowSpace()
        self.setIsIcon()

        super.selectedValueChanged(oldValue: oldValue)
    }

    // MARK: - Private Setter

    private func setDynamicColors() {
        self.dynamicColors = self.getColorsUseCase.executeDynamic(
            theme: self.theme,
            isOn: self.selectedValue
        )
    }

    private func setStaticColors() {
        self.staticColors = self.getColorsUseCase.executeStatic(theme: self.theme)
    }

    private func setIsIcon() {
        self.isIcon = self.getIsIconUseCase.executeUI(
            isOnOffSwitchLabelsEnabled: self.isOnOffSwitchLabelsEnabled,
            contrast: self.contrast
        )
    }

    private func setShowSpace() {
        self.showSpace = self.getShowSpaceUseCase.execute(isOn: self.selectedValue)
    }
}
