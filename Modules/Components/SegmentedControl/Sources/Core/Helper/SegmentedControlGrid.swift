//
//  SegmentedControlGrid.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// Distributes the tags into rows and decides where the separators are displayed.
enum SegmentedControlGrid {

    // MARK: - Methods

    /// Splits the tags into balanced rows of at most `rowLength` items. A `rowLength` of 0 means a single row.
    static func rows(
        from tags: [AnyHashable],
        rowLength: Int
    ) -> [[AnyHashable]] {
        guard rowLength > 0, tags.count > rowLength else {
            return [tags]
        }

        var rows: [[AnyHashable]] = []
        var currentIndex = 0

        while currentIndex < tags.count {
            let remainingItems = tags.count - currentIndex
            let itemsInThisRow: Int

            if remainingItems <= rowLength {
                itemsInThisRow = remainingItems
            } else {
                let remainingRows = (remainingItems + rowLength - 1) / rowLength
                itemsInThisRow = (remainingItems + remainingRows - 1) / remainingRows
            }

            let endIndex = min(currentIndex + itemsInThisRow, tags.count)
            rows.append(Array(tags[currentIndex..<endIndex]))
            currentIndex = endIndex
        }

        return rows
    }

    /// Whether a vertical separator is displayed after the item at `columnIndex`.
    static func isVerticalSeparator(
        tags: Int,
        horizontalTags: Int,
        columnIndex: Int
    ) -> Bool {
        return tags > 1 && horizontalTags > 1 && columnIndex < horizontalTags - 1
    }

    /// Whether a horizontal separator is displayed after the row at `rowIndex`.
    static func isHorizontalSeparator(
        rows: Int,
        rowIndex: Int
    ) -> Bool {
        return rows > 1 && rowIndex < rows - 1
    }
}
