//
//  CommonUIViewModel.swift
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
// sourcery: <CompletedAnimation> = "CommonCompletedAnimationMock"
// sourcery: <SelectedValue> = "Bool"
internal class CommonUIViewModel<CompletedAnimation, SelectedValue>: ObservableObject where CompletedAnimation: CommonCompletedAnimation, SelectedValue: Equatable {

    // MARK: - Published Properties

    @Published private(set) var dim: CGFloat = 1
    @Published private(set) var contentRadius: CGFloat = 0
    @Published private(set) var spacing: CGFloat = 0
    @Published private(set) var titleStyle = CommonTitleStyle()

    // MARK: - Properties

    private let type: CommonType
    private var alreadyUpdateAll = false

    var theme: any Theme {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setContentRadius()
            self.setDim()
            self.setFont()
            self.setSpacing()
        }
    }

    private(set) var selectedValue: SelectedValue {
        didSet {
            guard oldValue != self.selectedValue, self.alreadyUpdateAll else { return }

            self.selectedValueChanged(oldValue: oldValue)
        }
    }

    var isEnabled: Bool = true {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    var isReduceMotionEnabled: Bool = false {
        didSet {
            guard oldValue != self.isReduceMotionEnabled, self.alreadyUpdateAll else { return }

            self.setStaticAnimationType()
            self.setDynamicAnimationType()
        }
    }

    private var selectedValueAnimated: Bool = false

    private var completedAnimation = [CompletedAnimation]()

    private(set) var staticAnimationType: UIExecuteAnimationType = .unanimated
    private(set) var dynamicAnimationType: UIExecuteAnimationType = .unanimated

    // MARK: - Use Case Properties

    private let getAnimationTypeUseCase: any CommonGetAnimationTypeUseCaseable
    private let getContentRadiusUseCase: any CommonGetContentRadiusUseCaseable
    private let getDimUseCase: any CommonGetDimUseCaseable
    private let getSpacingUseCase: any CommonGetSpacingUseCaseable
    private let getTitleStyleUseCase: any CommonGetTitleStyleUseCaseable
    private let resetAnimationUseCase: any CommonResetAnimationUseCaseable

    // MARK: - Initialization

    init(
        type: CommonType,
        theme: any Theme,
        selectedValue: SelectedValue,
        getAnimationTypeUseCase: any CommonGetAnimationTypeUseCaseable = CommonGetAnimationTypeUseCase(),
        getContentRadiusUseCase: any CommonGetContentRadiusUseCaseable = CommonGetContentRadiusUseCase(),
        getDimUseCase: any CommonGetDimUseCaseable = CommonGetDimUseCase(),
        getSpacingUseCase: any CommonGetSpacingUseCaseable = CommonGetSpacingUseCase(),
        getTitleStyleUseCase: any CommonGetTitleStyleUseCaseable = CommonGetTitleStyleUseCase(),
        resetAnimationUseCase: any CommonResetAnimationUseCaseable = CommonResetAnimationUseCase()
    ) {
        self.type = type
        self.selectedValue = selectedValue
        self.theme = theme

        self.getAnimationTypeUseCase = getAnimationTypeUseCase
        self.getContentRadiusUseCase = getContentRadiusUseCase
        self.getDimUseCase = getDimUseCase
        self.getSpacingUseCase = getSpacingUseCase
        self.getTitleStyleUseCase = getTitleStyleUseCase
        self.resetAnimationUseCase = resetAnimationUseCase
    }

    // MARK: - Load

    func load(
        isReduceMotionEnabled: Bool
    ) {
        self.isReduceMotionEnabled = isReduceMotionEnabled

        self.setStaticAnimationType()
        self.setDynamicAnimationType()
        self.setContentRadius()
        self.setDim()
        self.setFont()
        self.setSpacing()

        self.alreadyUpdateAll = true
    }

    // MARK: - Action

    func setSelectedValue(_ selectedValue: SelectedValue, animated: Bool = false) {
        guard selectedValue != self.selectedValue else { return }

        self.completedAnimation.removeAll()

        self.selectedValueAnimated = animated
        self.setDynamicAnimationType()
        self.selectedValue = selectedValue
    }

    func setCompletedAnimation(_ animation: CompletedAnimation) {
        self.completedAnimation.append(animation)
        self.resetDynamicAnimationType()
    }

    // MARK: - Update

    func selectedValueChanged(oldValue: SelectedValue) {
    }

    // MARK: - Private Setter

    private func setContentRadius() {
        self.contentRadius = self.getContentRadiusUseCase.execute(
            theme: self.theme,
            type: self.type
        )
    }

    private func setDim() {
        self.dim = self.getDimUseCase.execute(
            theme: self.theme,
            isEnabled: self.isEnabled
        )
    }

    private func setFont() {
        self.titleStyle = self.getTitleStyleUseCase.execute(theme: self.theme)
    }

    private func setSpacing() {
        self.spacing = self.getSpacingUseCase.execute(theme: self.theme)
    }

    private func setStaticAnimationType() {
        self.staticAnimationType = self.getAnimationTypeUseCase.execute(
            isReduceMotionEnabled: self.isReduceMotionEnabled
        )
    }

    private func setDynamicAnimationType() {
        self.dynamicAnimationType = self.getAnimationTypeUseCase.execute(
            selectedValueAnimated: self.selectedValueAnimated,
            isReduceMotionEnabled: self.isReduceMotionEnabled
        )
    }

    private func resetDynamicAnimationType() {
        self.resetAnimationUseCase.execute(
            animationType: &self.dynamicAnimationType,
            completedAnimations: &self.completedAnimation,
            selectedValueAnimated: &self.selectedValueAnimated,
            isReduceMotionEnabled: self.isReduceMotionEnabled
        )
    }
}
