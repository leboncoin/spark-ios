//
//  TextLinkGetUnderlineUseCaseDeprecated.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 06/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used by the new SparkTextLink or SparkUITextLink")
protocol TextLinkGetUnderlineUseCaseDeprecatedable {

    func execute(variant: TextLinkVariant,
                 isHighlighted: Bool) -> NSUnderlineStyle?
}

struct TextLinkGetUnderlineUseCaseDeprecated: TextLinkGetUnderlineUseCaseDeprecatedable {

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
