//
//  IconographyItem.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct IconographyItem: Identifiable {

    // MARK: - Properties

    let name: String
    let image: Image
    let category: IconographyFilter

    var id: String {
        "\(self.category.rawValue)-\(self.name)"
    }
}

// MARK: - All Items

extension IconographyItem {

    static let all: [IconographyItem] = {
        let criteria = CriteriaIconography.allCases.map {
            IconographyItem(
                name: $0.rawValue,
                image: .init(sparkCriteria: $0.keyPath),
                category: .criteria
            )
        }

        let global = Iconography.allCases.map {
            IconographyItem(
                name: $0.rawValue,
                image: .init(spark: $0.keyPath),
                category: .global
            )
        }

        return criteria + global
    }()
}
