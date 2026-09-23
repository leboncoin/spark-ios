//
//  ButtonMainViewModelDeprecated.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 09.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// This ButtonMainViewModelDeprecated view contains all communs properties and rules for all buttons viewModel.
// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: titleFontToken = "Identical"
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
class ButtonMainViewModelDeprecated: ObservableObject {

    // MARK: - Properties

    var theme: any Theme {
        didSet {
            self.updateAll()
        }
    }

    var appearance: ButtonAppearance? { // TODO: Remove ASAP the optional
        didSet {
            guard self.appearance != oldValue else { return }
            self.colorsDidUpdate()
            self.borderDidUpdate()
        }
    }

    var intent: ButtonIntent {
        didSet {
            guard self.intent != oldValue else { return }
            self.colorsDidUpdate()
        }
    }

    var variant: ButtonVariant {
        didSet {
            guard self.variant != oldValue else { return }
            self.colorsDidUpdate()
            self.borderDidUpdate()
        }
    }

    var shape: ButtonShape {
        didSet {
            guard self.shape != oldValue else { return }
            self.borderDidUpdate()
        }
    }

    var size: ButtonSize {
        didSet {
            guard self.size != oldValue else { return }
            self.sizesDidUpdate()
        }
    }

    var isEnabled: Bool = true {
        didSet {
            guard self.isEnabled != oldValue else { return }
            self.stateDidUpdate()
        }
    }

    // MARK: - Published Properties

    @Published private(set) var state: ButtonStateDeprecated?

    @Published private(set) var colors: ButtonColors?

    @Published private(set) var sizes: ButtonSizes?
    @Published private(set) var border: ButtonBorder?

    // MARK: - Private Properties

    private let frameworkType: FrameworkType
    private let type: ButtonType

    private var isPressed: Bool = false

    // MARK: - UseCases

    let getBorderUseCase: any ButtonGetBorderUseCaseable
    let getColorsUseCase: any ButtonGetColorsUseCaseable
    let getSizesUseCase: any ButtonGetSizesUseCaseableDeprecated
    let getStateUseCase: any ButtonGetStateUseCaseDeprecatedable

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        type: ButtonType,
        theme: any Theme,
        appearance: ButtonAppearance?, // TODO: Remove ASAP the optional
        intent: ButtonIntent,
        variant: ButtonVariant,
        shape: ButtonShape,
        size: ButtonSize,
        getBorderUseCase: any ButtonGetBorderUseCaseable = ButtonGetBorderUseCase(),
        getColorsUseCase: any ButtonGetColorsUseCaseable = ButtonGetColorsUseCase(),
        getSizesUseCase: any ButtonGetSizesUseCaseableDeprecated = ButtonGetSizesUseCaseDeprecated(),
        getStateUseCase: any ButtonGetStateUseCaseDeprecatedable = ButtonGetStateUseCaseDeprecated()
    ) {
        self.frameworkType = frameworkType
        self.type = type
        self.theme = theme
        self.appearance = appearance
        self.intent = intent
        self.variant = variant
        self.shape = shape
        self.size = size

        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getSizesUseCase = getSizesUseCase
        self.getStateUseCase = getStateUseCase

        // Load the values directly on init just for SwiftUI
        if frameworkType == .swiftUI {
            self.updateAll()
        }
    }

    // MARK: - Load

    /// Load all published values. Should be called when all published values are subscribed by the view
    func load() {
        // Update all values when view is ready to receive published values
        self.updateAll()
    }

    // MARK: - Actions

    func pressedAction(_ isPressed: Bool) {
        if self.isPressed != isPressed {
            self.isPressed.toggle()

            self.colorsDidUpdate()
        }
    }

    // MARK: - Update

    internal func updateAll() {
        self.stateDidUpdate()
        self.colorsDidUpdate()
        self.sizesDidUpdate()
        self.borderDidUpdate()
    }

    private func stateDidUpdate() {
        self.state = self.getStateUseCase.execute(
            isEnabled: self.isEnabled,
            dims: self.theme.dims
        )
    }

    private func colorsDidUpdate() {
        self.colors = self.getColorsUseCase.execute(
            theme: self.theme,
            appearance: self.appearance,
            intent: self.intent,
            variant: self.variant,
            isPressed: self.isPressed
        )
    }

    private func sizesDidUpdate() {
        self.sizes = self.getSizesUseCase.execute(
            size: self.size,
            type: self.type
        )
    }

    private func borderDidUpdate() {
        self.border = self.getBorderUseCase.execute(
            theme: self.theme,
            appearance: self.appearance,
            intent: self.intent,
            shape: self.shape,
            variant: self.variant,
            removeStyles: false
        )
    }
}
