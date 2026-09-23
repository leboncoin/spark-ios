//
//  TextFieldViewModel.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 16/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// UseCase only used by **SwiftUI** TextField View.
// sourcery: AutoPublisherTest, AutoViewModelStub
internal final class TextFieldViewModel: TextInputViewModel {

    // MARK: - Published Properties

    @Published private(set) var isClearButton: Bool = false {
        didSet {
            self.setContentPadding()
        }
    }
    @Published private(set) var contentPadding: TextFieldContentPadding = .init()
    @Published private(set) var leftAddonPadding: EdgeInsets = .init()
    @Published private(set) var rightAddonPadding: EdgeInsets = .init()

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var clearMode: TextFieldClearMode? {
        didSet {
            guard oldValue != self.clearMode, self.alreadyUpdateAll else { return }
            self.setIsClearButton()
        }
    }

    var leftAddonConfiguration: TextFieldAddonConfiguration? {
        didSet {
            guard oldValue != self.leftAddonConfiguration, self.alreadyUpdateAll else { return }
            self.setLeftAddonPadding()
        }
    }

    var rightAddonConfiguration: TextFieldAddonConfiguration? {
        didSet {
            guard oldValue != self.rightAddonConfiguration, self.alreadyUpdateAll else { return }
            self.setRightAddonPadding()
        }
    }

    override var isFocused: Bool? {
        didSet {
            guard oldValue != self.isFocused, self.alreadyUpdateAll else { return }
            self.setIsClearButton()
        }
    }

    // MARK: - Use Case Properties

    private let getAddonPaddingUseCase: any TextFieldGetAddonPaddingUseCaseable
    private let getIsClearButtonUseCase: any TextFieldGetIsClearButtonUseCaseable
    private let getContentPaddingUseCase: any TextFieldGetContentPaddingUseCaseable

    // MARK: - Initialization

    init(
        getAddonPaddingUseCase: any TextFieldGetAddonPaddingUseCaseable = TextFieldGetAddonPaddingUseCase(),
        getIsClearButtonUseCase: any TextFieldGetIsClearButtonUseCaseable = TextFieldGetIsClearButtonUseCase(),
        getContentPaddingUseCase: any TextFieldGetContentPaddingUseCaseable = TextFieldGetContentPaddingUseCase()
    ) {
        self.getAddonPaddingUseCase = getAddonPaddingUseCase
        self.getIsClearButtonUseCase = getIsClearButtonUseCase
        self.getContentPaddingUseCase = getContentPaddingUseCase
    }

    func updateAll(
        theme: any Theme,
        intent: TextInputIntent,
        isReadOnly: Bool,
        clearMode: TextFieldClearMode,
        leftAddonConfiguration: TextFieldAddonConfiguration,
        rightAddonConfiguration: TextFieldAddonConfiguration,
        isFocused: Bool,
        isEnabled: Bool
    ) {
        self.clearMode = clearMode
        self.leftAddonConfiguration = leftAddonConfiguration
        self.rightAddonConfiguration = rightAddonConfiguration

        super.updateAll(
            theme: theme,
            intent: intent,
            isReadOnly: isReadOnly,
            isFocused: isFocused,
            isEnabled: isEnabled
        )

        self.setIsClearButton()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setIsClearButton() {
        guard let clearMode, let isFocused else {
            return
        }

        self.isClearButton = self.getIsClearButtonUseCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )
    }

    private func setContentPadding() {
        self.contentPadding = self.getContentPaddingUseCase.execute(
            spacings: self.spacings,
            isClearButton: self.isClearButton
        )
    }

    private func setAddonsPadding() {
        self.setLeftAddonPadding()
        self.setRightAddonPadding()
    }

    private func setLeftAddonPadding() {
        if let leftAddonConfiguration {
            self.leftAddonPadding = self.getAddonPaddingUseCase.executeLeft(
                spacings: self.spacings,
                configuration: leftAddonConfiguration
            )
        }
    }

    private func setRightAddonPadding() {
        if let rightAddonConfiguration {
            self.rightAddonPadding = self.getAddonPaddingUseCase.executeRight(
                spacings: self.spacings,
                configuration: rightAddonConfiguration
            )
        }
    }

    // MARK: - Update

    override func spacingDidUpdate() {
        self.setContentPadding()
        self.setAddonsPadding()
    }
}
