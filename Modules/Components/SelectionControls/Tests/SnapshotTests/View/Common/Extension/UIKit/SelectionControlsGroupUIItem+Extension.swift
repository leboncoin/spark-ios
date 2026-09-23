//
//  SelectionControlsGroupUIItem+Extension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 12/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSelectionControls

private extension SelectionControlsGroupUIItem where ID == Int {

    // MARK: - Methods

    static func allCases(contentResilience: CommonGroupContentResilience) -> [Self] {
        return Array(1...3).compactMap {
            .init(
                id: $0,
                text: contentResilience.text,
                isEnabled: true
            )
        }
    }
}

extension Array where Element == SelectionControlsGroupUIItem<Int> {

    static func allCases(contentResilience: CommonGroupContentResilience) -> [Element] {
        return Element.allCases(contentResilience: contentResilience)
    }
}
