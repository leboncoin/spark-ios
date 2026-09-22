//
//  ButtonViewModelDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: titleFontToken = "Identical"
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
class ButtonViewModelDeprecated: ButtonMainViewModelDeprecated {

    // MARK: - Properties

    var alignment: ButtonAlignment {
        didSet {
            guard self.alignment != oldValue else { return }
            self.alignmentDidUpdate()
        }
    }

    // MARK: - Published Properties

    @Published private(set) var layout: ButtonLayout?
    @Published private(set) var isImageTrailing: Bool = false
    @Published private(set) var titleFontToken: (any TypographyFontToken)?

    // MARK: - Private Properties

    private let getSpacingsUseCase: any ButtonGetSpacingsUseCaseDeprecatedable

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        theme: any Theme,
        appearance: ButtonAppearance?, // TODO: Remove ASAP the optional
        intent: ButtonIntent,
        variant: ButtonVariant,
        shape: ButtonShape,
        size: ButtonSize,
        alignment: ButtonAlignment,
        getSpacingsUseCase: any ButtonGetSpacingsUseCaseDeprecatedable = ButtonGetSpacingsUseCaseDeprecated()
    ) {
        self.alignment = alignment
        self.getSpacingsUseCase = getSpacingsUseCase

        super.init(
            for: frameworkType,
            type: .button,
            theme: theme,
            appearance: appearance,
            intent: intent,
            variant: variant,
            shape: shape,
            size: size
        )
    }

    // MARK: - Update

    override func updateAll() {
        super.updateAll()

        self.alignmentDidUpdate()
        self.layoutDidUpdate()
        self.titleFontDidUpdate()
    }

    private func alignmentDidUpdate() {
        self.isImageTrailing = self.alignment.isTrailingImage
    }

    private func layoutDidUpdate() {
        self.layout = self.getSpacingsUseCase.execute(
            spacing: self.theme.layout.spacing
        )
    }

    private func titleFontDidUpdate() {
        self.titleFontToken = self.theme.typography.callout
    }
}
