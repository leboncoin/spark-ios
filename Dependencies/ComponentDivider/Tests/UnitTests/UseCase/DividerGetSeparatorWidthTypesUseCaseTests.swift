//
//  DividerGetSeparatorWidthTypesUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentDivider

final class DividerGetSeparatorWidthTypesUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: DividerGetSeparatorWidthTypesUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        self.useCase = DividerGetSeparatorWidthTypesUseCase()
    }

    override func tearDown() {
        self.useCase = nil
        super.tearDown()
    }

    // MARK: - Execute Tests - Vertical Axis

    func test_execute_vertical_top() {
        // GIVEN
        let alignment: DividerAlignment = .top
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .fixed,
            "First separator should be fixed for vertical axis with top alignment"
        )
        XCTAssertEqual(
            result.last,
            .dynamic,
            "Last separator should be dynamic for vertical axis with top alignment"
        )
    }

    func test_execute_vertical_bottom() {
        // GIVEN
        let alignment: DividerAlignment = .bottom
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .dynamic,
            "First separator should be dynamic for vertical axis with bottom alignment"
        )
        XCTAssertEqual(
            result.last,
            .fixed,
            "Last separator should be fixed for vertical axis with bottom alignment"
        )
    }

    func test_execute_vertical_center() {
        // GIVEN
        let alignment: DividerAlignment = .center
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .equal,
            "First separator should be equal for vertical axis with center alignment"
        )
        XCTAssertEqual(
            result.last,
            .equal,
            "Last separator should be equal for vertical axis with center alignment"
        )
    }

    func test_execute_vertical_leading() {
        // GIVEN
        let alignment: DividerAlignment = .leading
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .equal,
            "First separator should be equal for vertical axis with leading alignment"
        )
        XCTAssertEqual(
            result.last,
            .equal,
            "Last separator should be equal for vertical axis with leading alignment"
        )
    }

    func test_execute_vertical_trailing() {
        // GIVEN
        let alignment: DividerAlignment = .trailing
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .equal,
            "First separator should be equal for vertical axis with trailing alignment"
        )
        XCTAssertEqual(
            result.last,
            .equal,
            "Last separator should be equal for vertical axis with trailing alignment"
        )
    }

    // MARK: - Execute Tests - Horizontal Axis

    func test_execute_horizontal_leading() {
        // GIVEN
        let alignment: DividerAlignment = .leading
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .fixed,
            "First separator should be fixed for horizontal axis with leading alignment"
        )
        XCTAssertEqual(
            result.last,
            .dynamic,
            "Last separator should be dynamic for horizontal axis with leading alignment"
        )
    }

    func test_execute_horizontal_trailing() {
        // GIVEN
        let alignment: DividerAlignment = .trailing
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .dynamic,
            "First separator should be dynamic for horizontal axis with trailing alignment"
        )
        XCTAssertEqual(
            result.last,
            .fixed,
            "Last separator should be fixed for horizontal axis with trailing alignment"
        )
    }

    func test_execute_horizontal_center() {
        // GIVEN
        let alignment: DividerAlignment = .center
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .equal,
            "First separator should be equal for horizontal axis with center alignment"
        )
        XCTAssertEqual(
            result.last,
            .equal,
            "Last separator should be equal for horizontal axis with center alignment"
        )
    }

    func test_execute_horizontal_top() {
        // GIVEN
        let alignment: DividerAlignment = .top
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .equal,
            "First separator should be equal for horizontal axis with top alignment"
        )
        XCTAssertEqual(
            result.last,
            .equal,
            "Last separator should be equal for horizontal axis with top alignment"
        )
    }

    func test_execute_horizontal_bottom() {
        // GIVEN
        let alignment: DividerAlignment = .bottom
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        XCTAssertEqual(
            result.first,
            .equal,
            "First separator should be equal for horizontal axis with bottom alignment"
        )
        XCTAssertEqual(
            result.last,
            .equal,
            "Last separator should be equal for horizontal axis with bottom alignment"
        )
    }
}
