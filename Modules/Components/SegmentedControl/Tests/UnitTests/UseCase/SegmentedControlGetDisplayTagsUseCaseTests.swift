//
//  SegmentedControlGetDisplayTagsUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

@Suite("SegmentedControl Get Display Tags Use Case Tests")
struct SegmentedControlGetDisplayTagsUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetDisplayTagsUseCase

    // MARK: - Initialization

    init() {
        self.sut = SegmentedControlGetDisplayTagsUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns single row for 1 item")
    func executeReturnsSingleRowFor1Item() {
        // GIVEN
        let tags: [AnyHashable] = [0]

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 1)
        #expect(result[0].count == 1)
        #expect(result[0][0] as? Int == 0)
    }

    @Test("Execute returns single row for 4 items")
    func executeReturnsSingleRowFor4Items() {
        // GIVEN
        let tags: [AnyHashable] = [0, 1, 2, 3]

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 1)
        #expect(result[0].count == 4)
        #expect(result[0] == tags)
    }

    @Test("Execute returns two rows for 5 items")
    func executeReturnsTwoRowsFor5Items() {
        // GIVEN
        let tags: [AnyHashable] = [0, 1, 2, 3, 4]

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 2)
        #expect(result[0].count == 3)
        #expect(result[1].count == 2)
        #expect(result[0] == [0, 1, 2])
        #expect(result[1] == [3, 4])
    }

    @Test("Execute returns two rows for 6 items")
    func executeReturnsTwoRowsFor6Items() {
        // GIVEN
        let tags: [AnyHashable] = [0, 1, 2, 3, 4, 5]

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 2)
        #expect(result[0].count == 3)
        #expect(result[1].count == 3)
        #expect(result[0] == [0, 1, 2])
        #expect(result[1] == [3, 4, 5])
    }

    @Test("Execute returns two rows for 8 items")
    func executeReturnsTwoRowsFor8Items() {
        // GIVEN
        let tags: [AnyHashable] = [0, 1, 2, 3, 4, 5, 6, 7]

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 2)
        #expect(result[0].count == 4)
        #expect(result[1].count == 4)
        #expect(result[0] == [0, 1, 2, 3])
        #expect(result[1] == [4, 5, 6, 7])
    }

    @Test("Execute returns three rows for 9 items")
    func executeReturnsThreeRowsFor9Items() {
        // GIVEN
        let tags: [AnyHashable] = [0, 1, 2, 3, 4, 5, 6, 7, 8]

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 3)
        #expect(result[0].count == 3)
        #expect(result[1].count == 3)
        #expect(result[2].count == 3)
        #expect(result[0] == [0, 1, 2])
        #expect(result[1] == [3, 4, 5])
        #expect(result[2] == [6, 7, 8])
    }

    @Test("Execute returns empty array for empty input")
    func executeReturnsEmptyArrayForEmptyInput() {
        // GIVEN
        let tags: [AnyHashable] = []

        // WHEN
        let result = self.sut.execute(tags: tags)

        // THEN
        #expect(result.count == 1)
        #expect(result[0].isEmpty)
    }
}
