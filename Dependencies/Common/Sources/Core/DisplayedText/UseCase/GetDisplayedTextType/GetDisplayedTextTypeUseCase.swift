//
//  GetDisplayedTextTypeUseCase.swift
//  SparkCommon
//
//  Created by robin.lemaire on 12/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
@_spi(SI_SPI) public protocol GetDisplayedTextTypeUseCaseable {
    func execute(text: String?,
                 attributedText: AttributedStringEither?) -> DisplayedTextType

    func execute(text: String?) -> DisplayedTextType
    func execute(attributedText: AttributedStringEither?) -> DisplayedTextType
}

@_spi(SI_SPI) public struct GetDisplayedTextTypeUseCase: GetDisplayedTextTypeUseCaseable {

    // MARK: - Initialization

    public init() {
    }

    // MARK: - Execute

    /// Get the displayed text type from a text and attributedText.
    public func execute(
        text: String?,
        attributedText: AttributedStringEither?
    ) -> DisplayedTextType {
        switch (text, attributedText) {
        case (nil, nil):
            return .none
        case (_, nil):
            return .text
        case (nil, _), (_, _):
            return .attributedText
        }
    }

    /// Get the new displayed text type when text changed
    public func execute(
        text: String?
    ) -> DisplayedTextType {
        return self.execute(
            text: text,
            attributedText: nil
        )
    }

    /// Get the new displayed text type when attributedText changed
    public func execute(
        attributedText: AttributedStringEither?
    ) -> DisplayedTextType {
        return self.execute(
            text: nil,
            attributedText: attributedText
        )
    }
}
