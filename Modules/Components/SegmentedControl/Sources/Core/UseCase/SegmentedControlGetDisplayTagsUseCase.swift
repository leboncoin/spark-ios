//
//  SegmentedControlGetDisplayTagsUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetDisplayTagsUseCaseable {
    func execute(tags: [AnyHashable]) -> [[AnyHashable]]
}

struct SegmentedControlGetDisplayTagsUseCase: SegmentedControlGetDisplayTagsUseCaseable {

    // MARK: - Methods

    func execute(tags: [AnyHashable]) -> [[AnyHashable]] {
        let maxTagByLine = 4

        guard tags.count > maxTagByLine else {
            return [tags]
        }

        var rows: [[AnyHashable]] = []
        var currentIndex = 0

        while currentIndex < tags.count {
            let remainingItems = tags.count - currentIndex
            let itemsInThisRow: Int

            if remainingItems <= maxTagByLine {
                itemsInThisRow = remainingItems
            } else {
                let remainingRows = (remainingItems + maxTagByLine - 1) / maxTagByLine
                itemsInThisRow = (remainingItems + remainingRows - 1) / remainingRows
            }

            let endIndex = min(currentIndex + itemsInThisRow, tags.count)
            rows.append(Array(tags[currentIndex..<endIndex]))
            currentIndex = endIndex
        }

        return rows
    }
}
