//
//  ButtonConstantsTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentButton

@Suite("Button Constants Tests")
struct ButtonConstantsTests {

    // MARK: - Tests

    @Test("Animation fast duration constant")
    func animationFastDurationConstant() {
        // GIVEN / WHEN / THEN
        #expect(ButtonConstants.Animation.fastDuration == 0.1)
    }

    @Test("Animation slow duration constant")
    func animationSlowDurationConstant() {
        // GIVEN / WHEN / THEN
        #expect(ButtonConstants.Animation.slowDuration == 0.3)
    }
}
