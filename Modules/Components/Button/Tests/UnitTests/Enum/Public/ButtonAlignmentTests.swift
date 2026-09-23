//
//  ButtonAlignmentTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Alignment Tests")
struct ButtonAlignmentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonAlignment] = [.leadingImage, .trailingImage]

        // WHEN / THEN
        #expect(ButtonAlignment.allCases.count == expectedCases.count)
        #expect(Set(ButtonAlignment.allCases) == Set(expectedCases))
    }

    @Test("Default value is trailingImage")
    func defaultValueIsTrailingImage() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAlignment.default == .trailingImage)
    }

    @Test("isTrailingImage is true when alignment is trailingImage")
    func isTrailingImageIsTrueWhenAlignmentIsTrailingImage() {
        // GIVEN
        let alignment = ButtonAlignment.trailingImage

        // WHEN / THEN
        #expect(alignment.isTrailingImage == true)
    }

    @Test("isTrailingImage is false when alignment is leadingImage")
    func isTrailingImageIsFalseWhenAlignmentIsLeadingImage() {
        // GIVEN
        let alignment = ButtonAlignment.leadingImage

        // WHEN / THEN
        #expect(alignment.isTrailingImage == false)
    }

    @Test("uiKitImagePlacement returns leading when alignment is leadingImage")
    func uiKitImagePlacementReturnsLeadingWhenAlignmentIsLeadingImage() {
        // GIVEN
        let alignment = ButtonAlignment.leadingImage

        // WHEN / THEN
        #expect(alignment.uiKitImagePlacement == .leading)
    }

    @Test("uiKitImagePlacement returns trailing when alignment is trailingImage")
    func uiKitImagePlacementReturnsTrailingWhenAlignmentIsTrailingImage() {
        // GIVEN
        let alignment = ButtonAlignment.trailingImage

        // WHEN / THEN
        #expect(alignment.uiKitImagePlacement == .trailing)
    }
}
