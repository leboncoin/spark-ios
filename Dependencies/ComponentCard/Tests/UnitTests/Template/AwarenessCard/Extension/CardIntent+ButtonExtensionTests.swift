//
//  CardIntent+ButtonExtensionTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkComponentButton
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardIntent+ButtonExtension Tests")
struct CardIntentButtonExtensionTests {

    // MARK: - Tests

    @Test("Test buttonIntent for all CardIntent cases")
    func testButtonIntentMapping() {
        // GIVEN / WHEN / THEN
        #expect(CardIntent.accent.buttonIntent == .accent)
        #expect(CardIntent.alert.buttonIntent == .alert)
        #expect(CardIntent.error.buttonIntent == .danger)
        #expect(CardIntent.info.buttonIntent == .info)
        #expect(CardIntent.main.buttonIntent == .main)
        #expect(CardIntent.neutral.buttonIntent == .neutral)
        #expect(CardIntent.success.buttonIntent == .success)
        #expect(CardIntent.support.buttonIntent == .support)
        #expect(CardIntent.surface.buttonIntent == .default)
    }

    @Test("Test buttonIntent for all cases", arguments: CardIntent.allCases)
    func testAllCases(cardIntent: CardIntent) {
        // GIVEN / WHEN
        let buttonIntent = cardIntent.buttonIntent

        // THEN
        switch cardIntent {
        case .accent: #expect(buttonIntent == .accent)
        case .alert: #expect(buttonIntent == .alert)
        case .error: #expect(buttonIntent == .danger)
        case .info: #expect(buttonIntent == .info)
        case .main: #expect(buttonIntent == .main)
        case .neutral: #expect(buttonIntent == .neutral)
        case .success: #expect(buttonIntent == .success)
        case .support: #expect(buttonIntent == .support)
        case .surface: #expect(buttonIntent == .default)
        }
    }
}
