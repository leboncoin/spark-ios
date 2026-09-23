//
//  SpinnerGetSizeUseCaseTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import XCTest

final class SpinnerGetSizeUseCaseTests: XCTestCase {

    // MARK: - Private properties

    private var sut: SpinnerGetSizeUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = SpinnerGetSizeUseCase()
    }

    // MARK: - Tests

    func test_execute_medium() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .medium)

        // THEN
        XCTAssertEqual(result, 28)
    }

    func test_execute_small() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .small)

        // THEN
        XCTAssertEqual(result, 20)
    }
}
