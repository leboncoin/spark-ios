//
//  SelectionControlsGroupItem+Extension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 12/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSelectionControls
import SwiftUI

private extension SelectionControlsGroupItem where ID == Int, Label == Text {

    // MARK: - Methods

    static func allCases(contentResilience: CommonGroupContentResilience) -> [Self] {
        return Array(1...3).compactMap {
            self.init(
                id: $0,
                title: contentResilience.text,
                isEnabled: true
            )
        }
    }
}

extension Array where Element == SelectionControlsGroupItem<Int, Text> {

    static func allCases(contentResilience: CommonGroupContentResilience) -> [Element] {
        return Element.allCases(contentResilience: contentResilience)
    }
}
