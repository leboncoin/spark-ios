//
//  SegmentedControlGetIsVerticalSeparatorUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

@Suite("SegmentedControl Get IsVerticalSeparator Use Case Tests")
struct SegmentedControlGetIsVerticalSeparatorUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetIsVerticalSeparatorUseCase

    // MARK: - Initialization

    init() {
        self.sut = SegmentedControlGetIsVerticalSeparatorUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns false when tags is 1")
    func executeReturnsFalseWhenTagsIs1() {
        // GIVEN
        let tags = 1
        let horizontalTags = 2
        let columnIndex = 0

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns false when horizontalTags is 1")
    func executeReturnsFalseWhenHorizontalTagsIs1() {
        // GIVEN
        let tags = 2
        let horizontalTags = 1
        let columnIndex = 0

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns false when columnIndex is last")
    func executeReturnsFalseWhenColumnIndexIsLast() {
        // GIVEN
        let tags = 4
        let horizontalTags = 2
        let columnIndex = 1

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns true when all conditions are met")
    func executeReturnsTrueWhenAllConditionsAreMet() {
        // GIVEN
        let tags = 6
        let horizontalTags = 3
        let columnIndex = 0

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true for middle column")
    func executeReturnsTrueForMiddleColumn() {
        // GIVEN
        let tags = 6
        let horizontalTags = 3
        let columnIndex = 1

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns false for last column")
    func executeReturnsFalseForLastColumn() {
        // GIVEN
        let tags = 6
        let horizontalTags = 3
        let columnIndex = 2

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns true when columnIndex is 0 of 2 columns")
    func executeReturnsTrueWhenColumnIndexIs0Of2Columns() {
        // GIVEN
        let tags = 4
        let horizontalTags = 2
        let columnIndex = 0

        // WHEN
        let result = self.sut.execute(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        #expect(result == true)
    }
}
