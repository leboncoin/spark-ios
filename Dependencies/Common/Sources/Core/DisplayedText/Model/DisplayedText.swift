//
//  DisplayedText.swift
//  SparkCommon
//
//  Created by robin.lemaire on 13/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) public struct DisplayedText: Equatable {

    // MARK: - Properties

    public let text: String?
    public let attributedText: AttributedStringEither?

    // MARK: - Initialization

    public init?(text: String?, attributedText: AttributedStringEither?) {
        // Both values cannot be nil
        guard text != nil || attributedText != nil else {
            return nil
        }

        self.text = text
        self.attributedText = attributedText
    }

    public init(text: String) {
        self.text = text
        self.attributedText = nil
    }

    public init(attributedText: AttributedStringEither) {
        self.text = nil
        self.attributedText = attributedText
    }
}
