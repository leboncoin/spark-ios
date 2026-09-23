//
//  InputOTPViewModel.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 03/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class InputOTPViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = InputOTPColors()
    @Published private(set) var layout = InputOTPLayout()
    @Published private(set) var typographies = InputOTPTypographies()
    @Published private(set) var dim: CGFloat = .zero
    @Published private(set) var isSeparator = false

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setLayout()
            self.setTypographies()
            self.setDim()
        }
    }

    var digits: InputOTPDigits? {
        didSet {
            guard oldValue != self.digits, self.alreadyUpdateAll else { return }

            self.setIsSeparator()
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

    private let getColorsUseCase: any InputOTPGetColorsUseCaseable
    private let getDimUseCase: any InputOTPGetDimUseCaseable
    private let getLayoutUseCase: any InputOTPGetLayoutUseCaseable
    private let getTypographiesUseCase: any InputOTPGetTypographiesUseCaseable
    private let getIsSeparatorUseCase: any InputOTPGetIsSeparatorUseCaseable
    private let getShowSeparatorUseCase: any InputOTPGetShowSeparatorUseCaseable
    private let getSlotValueUseCase: any InputOTPGetSlotValueUseCaseable
    private let getValidatedValueUseCase: any InputOTPGetValidatedValueUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any InputOTPGetColorsUseCaseable = InputOTPGetColorsUseCase(),
        getDimUseCase: any InputOTPGetDimUseCaseable = InputOTPGetDimUseCase(),
        getLayoutUseCase: any InputOTPGetLayoutUseCaseable = InputOTPGetLayoutUseCase(),
        getTypographiesUseCase: any InputOTPGetTypographiesUseCaseable = InputOTPGetTypographiesUseCase(),
        getIsSeparatorUseCase: any InputOTPGetIsSeparatorUseCaseable = InputOTPGetIsSeparatorUseCase(),
        getShowSeparatorUseCase: any InputOTPGetShowSeparatorUseCaseable = InputOTPGetShowSeparatorUseCase(),
        getSlotValueUseCase: any InputOTPGetSlotValueUseCaseable = InputOTPGetSlotValueUseCase(),
        getValidatedValueUseCase: any InputOTPGetValidatedValueUseCaseable = InputOTPGetValidatedValueUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getDimUseCase = getDimUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
        self.getIsSeparatorUseCase = getIsSeparatorUseCase
        self.getShowSeparatorUseCase = getShowSeparatorUseCase
        self.getSlotValueUseCase = getSlotValueUseCase
        self.getValidatedValueUseCase = getValidatedValueUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        digits: InputOTPDigits,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.digits = digits
        self.isEnabled = isEnabled

        self.setColors()
        self.setLayout()
        self.setTypographies()
        self.setDim()
        self.setIsSeparator()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme
        )
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme
        )
    }

    private func setTypographies() {
        guard let theme else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme
        )
    }

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    private func setIsSeparator() {
        guard let digits else { return }

        self.isSeparator = self.getIsSeparatorUseCase.execute(
            digits: digits
        )
    }

    // MARK: - Getter

    func getShowSeparator(at index: Int) -> Bool {
        guard let digits else { return false }

        return self.getShowSeparatorUseCase.execute(
            isSeparator: self.isSeparator,
            index: index,
            digits: digits
        )
    }

    func getSlotValue(value: String, at index: Int) -> String? {
        return self.getSlotValueUseCase.execute(
            value: value,
            index: index
        )
    }

    func getValidatedValue(value: String, codeType: InputOTPCodeType) -> InputOTPValidatedValue {
        guard let digits else {
            return .init(value: value)
        }

        return self.getValidatedValueUseCase.execute(
            value: value,
            codeType: codeType,
            digits: digits
        )
    }
}
