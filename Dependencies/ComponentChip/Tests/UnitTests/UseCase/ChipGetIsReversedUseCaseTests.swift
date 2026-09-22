//
//  ChipGetIsReversedUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 25/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip

final class ChipGetIsReversedUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetIsReversedUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = ChipGetIsReversedUseCase()
    }

    // MARK: - Tests

    func test_execute_with_leadingIcon_alignment() {
        // GIVEN / WHEN
        let result = self.sut.execute(alignment: .leadingIcon)

        // THEN
        XCTAssertTrue(result)
    }

    func test_execute_with_trailingIcon_alignment() {
        // GIVEN / WHEN
        let result = self.sut.execute(alignment: .trailingIcon)

        // THEN
        XCTAssertFalse(result)
    }
}
