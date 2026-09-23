//
//  CheckboxUIViewModel.swift
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
final internal class CheckboxUIViewModel: CommonUIViewModel<CheckboxCompletedAnimation, CheckboxSelectionState> {

    // MARK: - Published Properties

    @Published private(set) var dynamicColors = CheckboxDynamicColors()
    @Published private(set) var staticColors = CheckboxStaticColors()
    @Published private(set) var isIcon: Bool = false

    // MARK: - Properties

    private var alreadyUpdateAll = false

    override var theme: any Theme {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    var intent: CheckboxIntent = .default {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setDynamicColors()
            self.setStaticColors()
        }
    }

    // MARK: - Use Case Properties

    private let getColorsUseCase: any CheckboxGetColorsUseCaseable
    private let getIsIconUseCase: any CheckboxGetIsIconUseCaseable
    private let getNewSelectedValueUseCase: any CheckboxGetNewSelectedValueUseCaseable

    // MARK: - Initialization

    init(
        theme: any Theme,
        getColorsUseCase: any CheckboxGetColorsUseCaseable = CheckboxGetColorsUseCase(),
        getIsIconUseCase: any CheckboxGetIsIconUseCaseable = CheckboxGetIsIconUseCase(),
        getNewSelectedValueUseCase: any CheckboxGetNewSelectedValueUseCaseable = CheckboxGetNewSelectedValueUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getIsIconUseCase = getIsIconUseCase
        self.getNewSelectedValueUseCase = getNewSelectedValueUseCase

        super.init(
            type: .checkbox,
            theme: theme,
            selectedValue: .default // Default value
        )
    }

    // MARK: - Load

    override func load(isReduceMotionEnabled: Bool) {
        super.load(isReduceMotionEnabled: isReduceMotionEnabled)

        self.setDynamicColors()
        self.setStaticColors()
        self.setIsIcon()

        self.alreadyUpdateAll = true
    }

    // MARK: - Action

    func toggle() {
        guard let newValue = self.getNewSelectedValueUseCase.execute(
            selectionState: self.selectedValue,
            isEnabled: self.isEnabled
        ) else { return }

        self.setSelectedValue(newValue, animated: true)
    }

    // MARK: - Update

    override func selectedValueChanged(oldValue: CheckboxSelectionState) {
        guard oldValue != self.selectedValue, self.alreadyUpdateAll else { return }

        self.setDynamicColors()
        self.setIsIcon()
        super.selectedValueChanged(oldValue: oldValue)
    }

    // MARK: - Private Setter

    private func setDynamicColors() {
        self.dynamicColors = self.getColorsUseCase.executeDynamic(
            theme: self.theme,
            intent: self.intent,
            selectionState: self.selectedValue
        )
    }

    private func setStaticColors() {
        self.staticColors = self.getColorsUseCase.executeStatic(
            theme: self.theme,
            intent: self.intent
        )
    }

    private func setIsIcon() {
        self.isIcon = self.getIsIconUseCase.execute(
            selectionState: self.selectedValue
        )
    }
}
