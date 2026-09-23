//
//  InputOTPSlotViewModel.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class InputOTPSlotViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = InputOTPSlotColors()
    @Published private(set) var border = InputOTPSlotBorder()
    @Published private(set) var content = ""

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
        }
    }

    var value: String? {
        didSet {
            guard oldValue != self.value, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setContent()
        }
    }

    var onError: Bool? {
        didSet {
            guard oldValue != self.onError, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
        }
    }

    var isFocus: Bool? {
        didSet {
            guard oldValue != self.isFocus, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
            self.setContent()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getSlotBorderUseCase: any InputOTPGetSlotBorderUseCaseable
    private let getSlotColorsUseCase: any InputOTPGetSlotColorsUseCaseable
    private let getSlotContentUseCase: any InputOTPGetSlotContentUseCaseable

    // MARK: - Initialization

    init(
        getSlotBorderUseCase: any InputOTPGetSlotBorderUseCaseable = InputOTPGetSlotBorderUseCase(),
        getSlotColorsUseCase: any InputOTPGetSlotColorsUseCaseable = InputOTPGetSlotColorsUseCase(),
        getSlotContentUseCase: any InputOTPGetSlotContentUseCaseable = InputOTPGetSlotContentUseCase()
    ) {
        self.getSlotBorderUseCase = getSlotBorderUseCase
        self.getSlotColorsUseCase = getSlotColorsUseCase
        self.getSlotContentUseCase = getSlotContentUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        value: String?,
        onError: Bool,
        isFocus: Bool
    ) {
        self.theme = theme
        self.value = value
        self.onError = onError
        self.isFocus = isFocus

        self.setColors()
        self.setBorder()
        self.setContent()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme, let onError, let isFocus else { return }

        self.colors = self.getSlotColorsUseCase.execute(
            theme: theme,
            value: self.value,
            onError: onError,
            isFocus: isFocus
        )
    }

    private func setBorder() {
        guard let theme, let onError, let isFocus else { return }

        self.border = self.getSlotBorderUseCase.execute(
            theme: theme,
            onError: onError,
            isFocus: isFocus
        )
    }

    private func setContent() {
        guard let isFocus else { return }

        self.content = self.getSlotContentUseCase.execute(
            value: self.value,
            isFocus: isFocus
        )
    }
}
