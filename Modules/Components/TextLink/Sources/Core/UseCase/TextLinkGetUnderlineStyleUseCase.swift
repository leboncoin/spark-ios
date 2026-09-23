//
//  TextLinkGetUnderlineStyleUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetUnderlineStyleUseCaseable {
    func execute(
        variant: TextLinkVariant,
        isHighlighted: Bool
    ) -> NSUnderlineStyle?
}

struct TextLinkGetUnderlineStyleUseCase: TextLinkGetUnderlineStyleUseCaseable {

    // MARK: - Methods

    func execute(
        variant: TextLinkVariant,
        isHighlighted: Bool
    ) -> NSUnderlineStyle? {
        // Always single line when the textlink is highlighted
        guard !isHighlighted else {
            return .single
        }

        switch variant {
        case .underline:
            return .single
        case .none:
            return nil
        }
    }
}
