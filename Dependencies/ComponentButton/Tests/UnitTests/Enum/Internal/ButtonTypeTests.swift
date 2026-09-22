//
//  ButtonTypeTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 18/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Type Tests")
struct ButtonTypeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonType] = [.button, .iconButton]

        // WHEN / THEN
        #expect(ButtonType.allCases.count == expectedCases.count)
        #expect(Set(ButtonType.allCases) == Set(expectedCases))
    }

    @Test("Init with isTitle true and isImage false returns button")
    func initWithIsTitleTrueAndIsImageFalseReturnsButton() {
        // GIVEN / WHEN
        let type = ButtonType(isTitle: true, isImage: false)

        // THEN
        #expect(type == .button)
    }

    @Test("Init with isTitle true and isImage true returns button")
    func initWithIsTitleTrueAndIsImageTrueReturnsButton() {
        // GIVEN / WHEN
        let type = ButtonType(isTitle: true, isImage: true)

        // THEN
        #expect(type == .button)
    }

    @Test("Init with isTitle false and isImage true returns iconButton")
    func initWithIsTitleFalseAndIsImageTrueReturnsIconButton() {
        // GIVEN / WHEN
        let type = ButtonType(isTitle: false, isImage: true)

        // THEN
        #expect(type == .iconButton)
    }

    @Test("Init with isTitle false and isImage false returns button")
    func initWithIsTitleFalseAndIsImageFalseReturnsButton() {
        // GIVEN / WHEN
        let type = ButtonType(isTitle: false, isImage: false)

        // THEN
        #expect(type == .button)
    }
}
