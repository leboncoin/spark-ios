//
//  ButtonGetSizesUseCaseDeprecatedTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 12/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentButton

final class ButtonGetSizesUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Test Type is .iconButton with styles

    func test_execute_when_switchSize_is_small_case_and_type_is_iconButton() {
        // GIVEN
        let useCase = ButtonGetSizesUseCaseDeprecated()

        // WHEN
        let sizes = useCase.execute(
            size: .small,
            type: .iconButton
        )

        // THEN
        XCTAssertEqual(sizes.height, 32, "Wrong height value")
        XCTAssertEqual(sizes.width, 0, "Wrong width value")
        XCTAssertEqual(sizes.isFixedHeight, false, "Wrong isFixedHeight value")
        XCTAssertEqual(sizes.isFixedWidth, false, "Wrong isFixedWidth value")
        XCTAssertNil(sizes.maxHeight, "Wrong maxHeight value")
        XCTAssertEqual(sizes.imageSize, 16, "Wrong imageSize value")
    }

    func test_execute_when_switchSize_is_medium_case_and_type_is_iconButton() {
        // GIVEN
        let useCase = ButtonGetSizesUseCaseDeprecated()

        // WHEN
        let sizes = useCase.execute(
            size: .medium,
            type: .iconButton
        )

        // THEN
        XCTAssertEqual(sizes.height, 44, "Wrong height value")
        XCTAssertEqual(sizes.width, 0, "Wrong width value")
        XCTAssertEqual(sizes.isFixedHeight, false, "Wrong isFixedHeight value")
        XCTAssertEqual(sizes.isFixedWidth, false, "Wrong isFixedWidth value")
        XCTAssertNil(sizes.maxHeight, "Wrong maxHeight value")
        XCTAssertEqual(sizes.imageSize, 16, "Wrong imageSize value")
    }

    func test_execute_when_switchSize_is_large_case_and_type_is_iconButton() {
        // GIVEN
        let useCase = ButtonGetSizesUseCaseDeprecated()

        // WHEN
        let sizes = useCase.execute(
            size: .large,
            type: .iconButton
        )

        // THEN
        XCTAssertEqual(sizes.height, 56, "Wrong height value")
        XCTAssertEqual(sizes.width, 0, "Wrong width value")
        XCTAssertEqual(sizes.isFixedHeight, false, "Wrong isFixedHeight value")
        XCTAssertEqual(sizes.isFixedWidth, false, "Wrong isFixedWidth value")
        XCTAssertNil(sizes.maxHeight, "Wrong maxHeight value")
        XCTAssertEqual(sizes.imageSize, 24, "Wrong imageSize value")
    }
}
