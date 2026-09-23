//
//  ButtonContentVisibilityTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Content Visibility Tests")
struct ButtonContentVisibilityTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonContentVisibility] = [
            .showAll,
            .hideImage,
            .hideLabel
        ]

        // WHEN / THEN
        #expect(ButtonContentVisibility.allCases.count == expectedCases.count)
        #expect(Set(ButtonContentVisibility.allCases) == Set(expectedCases))
    }

    @Test("Default value is showAll")
    func defaultValueIsShowAll() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.default == .showAll)
    }

    @Test("ShowImage is true for showAll")
    func showImageIsTrueForShowAll() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.showAll.showImage == true)
    }

    @Test("ShowImage is false for hideImage")
    func showImageIsFalseForHideImage() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.hideImage.showImage == false)
    }

    @Test("ShowImage is true for hideLabel")
    func showImageIsTrueForHideLabel() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.hideLabel.showImage == true)
    }

    @Test("ShowLabel is true for showAll")
    func showLabelIsTrueForShowAll() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.showAll.showLabel == true)
    }

    @Test("ShowLabel is true for hideImage")
    func showLabelIsTrueForHideImage() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.hideImage.showLabel == true)
    }

    @Test("ShowLabel is false for hideLabel")
    func showLabelIsFalseForHideLabel() {
        // GIVEN / WHEN / THEN
        #expect(ButtonContentVisibility.hideLabel.showLabel == false)
    }
}
