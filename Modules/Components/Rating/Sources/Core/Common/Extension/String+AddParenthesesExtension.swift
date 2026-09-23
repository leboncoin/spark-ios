//
//  String+AddParenthesesExtension.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 11/02/2026.
//

import Foundation

extension String {

    // MARK: - Properties

    var addParentheses: Self {
        let prefix = "("
        let suffix = ")"

        let hasPrefix = self.hasPrefix(prefix)
        let hasSuffix = self.hasSuffix(suffix)

        return switch (hasPrefix, hasSuffix) {
        case (true, true): self
        case (true, false): self + suffix
        case (false, true): prefix + self
        case (false, false): prefix + self + suffix
        }
    }
}

