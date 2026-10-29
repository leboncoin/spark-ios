//
//  SegmentedControlGridTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

// MARK: - Tests

struct SegmentedControlGridTests {

    // MARK: - Rows Tests

    @Test("Rows should return balanced rows",
        arguments: [
            (1, 4, [[0]]),
            (4, 4, [[0, 1, 2, 3]]),
            (5, 4, [[0, 1, 2], [3, 4]]),
            (6, 4, [[0, 1, 2], [3, 4, 5]]),
            (7, 4, [[0, 1, 2, 3], [4, 5, 6]]),
            (8, 4, [[0, 1, 2, 3], [4, 5, 6, 7]]),
            (9, 4, [[0, 1, 2], [3, 4, 5], [6, 7, 8]]),
            (0, 4, [[]]),
            (8, 0, [[0, 1, 2, 3, 4, 5, 6, 7]]),
            (2, 1, [[0], [1]]),
            (3, 2, [[0, 1], [2]]),
            (6, 10, [[0, 1, 2, 3, 4, 5]])
        ]
    )
    func rowsShouldReturnBalancedRows(
        count: Int,
        rowLength: Int,
        expectedRows: [[Int]]
    ) {
        // GIVEN
        let tags: [AnyHashable] = Array(0..<count)

        // WHEN
        let result = SegmentedControlGrid.rows(from: tags, rowLength: rowLength)

        // THEN
        #expect(result == expectedRows.map { $0.map { AnyHashable($0) } })
    }

    // MARK: - Vertical Separator Tests

    @Test("Is vertical separator should return expected value",
        arguments: [
            (2, 3, 0, true),
            (2, 3, 1, true),
            (2, 3, 2, false),
            (1, 3, 0, false),
            (2, 1, 0, false),
            (0, 0, 0, false)
        ]
    )
    func isVerticalSeparatorShouldReturnExpectedValue(
        tags: Int,
        horizontalTags: Int,
        columnIndex: Int,
        expectedValue: Bool
    ) {
        // GIVEN / WHEN
        let result = SegmentedControlGrid.isVerticalSeparator(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == expectedValue)
    }

    // MARK: - Horizontal Separator Tests

    @Test("Is horizontal separator should return expected value",
        arguments: [
            (1, 0, false),
            (2, 0, true),
            (2, 1, false),
            (3, 1, true),
            (3, 2, false)
        ]
    )
    func isHorizontalSeparatorShouldReturnExpectedValue(
        rows: Int,
        rowIndex: Int,
        expectedValue: Bool
    ) {
        // GIVEN / WHEN
        let result = SegmentedControlGrid.isHorizontalSeparator(
            rows: rows,
            rowIndex: rowIndex
        )

        // THEN
        #expect(result == expectedValue)
    }
}
