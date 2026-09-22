//
//  DisplayedTextViewModel.swift
//  SparkCommon
//
//  Created by robin.lemaire on 12/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
@_spi(SI_SPI) public protocol DisplayedTextViewModel {
    var displayedTextType: DisplayedTextType { get }
    var displayedText: DisplayedText? { get }

    var containsText: Bool { get }

    /// Update the text only if the value changed.
    /// Return true if value changed.
    @discardableResult
    func textChanged(_ text: String?) -> Bool
    /// Update the attributed text only if the value changed.
    /// Return true if value changed.
    @discardableResult
    func attributedTextChanged(_ attributedText: AttributedStringEither?) -> Bool
}

// View model used by a component view model that contains a text/attributed management.
@_spi(SI_SPI) public final class DisplayedTextViewModelDefault: DisplayedTextViewModel {

    // MARK: - Internal Properties

    public private(set) var displayedTextType: DisplayedTextType
    public private(set) var displayedText: DisplayedText?

    public var containsText: Bool {
        self.displayedTextType.containsText
    }

    // MARK: - Private Properties

    private let getDisplayedTextTypeUseCase: GetDisplayedTextTypeUseCaseable
    private let getDidDisplayedTextChangeUseCase: GetDidDisplayedTextChangeUseCaseable

    // MARK: - Initialization

    public init(
        text: String?,
        attributedText: AttributedStringEither?,
        getDisplayedTextTypeUseCase: GetDisplayedTextTypeUseCaseable = GetDisplayedTextTypeUseCase(),
        getDidDisplayedTextChangeUseCase: GetDidDisplayedTextChangeUseCaseable = GetDidDisplayedTextChangeUseCase()
    ) {
        self.displayedText = .init(
            text: text,
            attributedText: attributedText
        )
        self.displayedTextType = getDisplayedTextTypeUseCase.execute(
            text: text,
            attributedText: attributedText
        )

        self.getDisplayedTextTypeUseCase = getDisplayedTextTypeUseCase
        self.getDidDisplayedTextChangeUseCase = getDidDisplayedTextChangeUseCase
    }

    // MARK: - Internal Methods

    public func textChanged(_ text: String?) -> Bool {
        // Displayed text changed ?
        if self.getDidDisplayedTextChangeUseCase.execute(
            currentText: self.displayedText?.text,
            newText: text,
            displayedTextType: self.displayedTextType
        ) {
            self.displayedText = text.map { .init(text: $0) }
            self.displayedTextType = self.getDisplayedTextTypeUseCase.execute(
                text: text
            )

            return true
        }

        return false
    }

    public func attributedTextChanged(_ attributedText: AttributedStringEither?) -> Bool {
        // Displayed attributed text changed ?
        if self.getDidDisplayedTextChangeUseCase.execute(
            currentAttributedText: self.displayedText?.attributedText,
            newAttributedText: attributedText,
            displayedTextType: self.displayedTextType
        ) {
            self.displayedTextType = self.getDisplayedTextTypeUseCase.execute(
                attributedText: attributedText
            )
            self.displayedText = attributedText.map { .init(attributedText: $0) }

            return true
        }

        return false
    }
}
