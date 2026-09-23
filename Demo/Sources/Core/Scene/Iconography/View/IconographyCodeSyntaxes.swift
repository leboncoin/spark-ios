//
//  IconographyCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 18/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct IconographyCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Global - SwiftUI", code: Self.globalSwiftUI),
            .init(title: "Criteria - SwiftUI", code: Self.criteriaSwiftUI),
            .init(title: "Global - UIKit", code: Self.globalUIKit),
            .init(title: "Criteria - UIKit", code: Self.criteriaUIKit),
        ]
    }()

    // MARK: - Private Properties

    private static var globalSwiftUI: String {
        """
        Image(spark: \\.actionsFill)
        """
    }

    private static var criteriaSwiftUI: String {
        """
        Image(sparkCriteria: \\.accessories)
        """
    }

    private static var globalUIKit: String {
        """
        UIImage(spark: \\.actionsFill)
        """
    }

    private static var criteriaUIKit: String {
        """
        UIImage(sparkCriteria: \\.accessories)
        """
    }
}
