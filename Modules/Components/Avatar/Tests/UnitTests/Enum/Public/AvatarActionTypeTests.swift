//
//  AvatarActionTypeTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
import SparkResources
@_spi(SI_SPI) import SparkCommon
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarActionTypeTests {

    // MARK: - Tests

    @Test(
        arguments: [
            (AvatarActionType.add, Image(spark: \.plus)),
            (.edit, Image(spark: \.penOutline))
        ]
    )
    func iconShouldReturnExpectedValue(actionType: AvatarActionType, expectedIcon: Image) {
        // GIVEN / WHEN
        let result = actionType.icon

        // THEN
        #expect(result == expectedIcon)
    }

    @Test
    func allCasesShouldContainAllExpectedValues() {
        // GIVEN / WHEN
        let result = AvatarActionType.allCases

        // THEN
        #expect(result.count == 2)
        #expect(result.contains(.add))
        #expect(result.contains(.edit))
    }
}
