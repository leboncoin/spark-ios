//
//  TextLinkViewModel.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

/// This ViewModel is only used for **SwiftUI**.
///
// sourcery: AutoPublisherTest, AutoViewModelStub-
final class TextLinkViewModel: TextLinkCommonViewModel {

    // MARK: - Published Properties

    @Published private(set) var attributedString: AttributedString = .init()

    // MARK: - Use Case Properties

    private let getAttributedStringUseCase: any TextLinkGetAttributedStringUseCaseable

    // MARK: - Initialization

    init(
        getAttributedStringUseCase: any TextLinkGetAttributedStringUseCaseable = TextLinkGetAttributedStringUseCase()
    ) {
        self.getAttributedStringUseCase = getAttributedStringUseCase

        super.init()
    }

    // MARK: - Setter

    override func setAttributedString() {
        super.setAttributedString()

        guard let theme,
              let intent,
              let variant,
              let typography,
              let text else {
            return
        }

        self.attributedString = self.getAttributedStringUseCase.execute(
            theme: theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: self.textHighlightRange,
            isHighlighted: self.isHighlighted
        )
    }
}
