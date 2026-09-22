//
//  RadioButtonUIViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 03/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **UIKit** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
final internal class RadioButtonUIViewModel: CommonUIViewModel<RadioButtonCompletedAnimation, Bool> {

    // MARK: - Published Properties

    @Published private(set) var dynamicColors = RadioButtonDynamicColors()
    @Published private(set) var staticColors = RadioButtonStaticColors()
    @Published private(set) var showSelectedDot = false

    // MARK: - Properties

    private var alreadyUpdateAll = false

    override var theme: any Theme {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    var intent: RadioButtonIntent = .default {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    // MARK: - Use Case Properties

    private let getColorsUseCase: any RadioButtonGetColorsUseCaseable
    private let getShowSelectedDotUseCase: any RadioButtonGetShowSelectedDotUseCaseable

    // MARK: - Initialization

    init(
        theme: any Theme,
        getColorsUseCase: any RadioButtonGetColorsUseCaseable = RadioButtonGetColorsUseCase(),
        getShowSelectedDotUseCase: any RadioButtonGetShowSelectedDotUseCaseable = RadioButtonGetShowSelectedDotUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getShowSelectedDotUseCase = getShowSelectedDotUseCase

        super.init(
            type: .radioButton,
            theme: theme,
            selectedValue: false // Default value
        )
    }

    // MARK: - Load

    override func load(isReduceMotionEnabled: Bool) {
        super.load(isReduceMotionEnabled: isReduceMotionEnabled)

        self.setDynamicColors()
        self.setStaticColors()
        self.setShowSelectedDotUseCase()

        self.alreadyUpdateAll = true
    }

    // MARK: - Action

    func toggleIfPossible() -> Bool {
        guard !self.selectedValue else {
            return false
        }

        self.setSelectedValue(!self.selectedValue, animated: true)
        return true
    }

    // MARK: - Update

    override func selectedValueChanged(oldValue: Bool) {
        guard oldValue != self.selectedValue, self.alreadyUpdateAll else { return }

        self.setDynamicColors()
        self.setShowSelectedDotUseCase()
        super.selectedValueChanged(oldValue: oldValue)
    }

    // MARK: - Private Setter

    private func setDynamicColors() {
        self.dynamicColors = self.getColorsUseCase.executeDynamic(
            theme: self.theme,
            intent: self.intent,
            isOn: self.selectedValue
        )
    }

    private func setStaticColors() {
        self.staticColors = self.getColorsUseCase.executeStatic(
            theme: self.theme,
            intent: self.intent
        )
    }

    private func setShowSelectedDotUseCase() {
        self.showSelectedDot = self.getShowSelectedDotUseCase.execute(
            isSelected: self.selectedValue
        )
    }
}
