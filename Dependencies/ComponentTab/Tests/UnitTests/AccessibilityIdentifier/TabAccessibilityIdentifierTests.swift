//
//  TabAccessibilityIdentifierTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTab

@Suite("Tab Accessibility Identifier Tests")
struct TabAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View identifier")
    func viewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(TabAccessibilityIdentifier.view == "spark-tab")
    }

    @Test("Item identifier")
    func itemIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(TabAccessibilityIdentifier.item(at: 2) == "spark-tab-item-2")
    }

    @Test("Deprecated tab identifier")
    func deprecatedTabIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(TabAccessibilityIdentifier.tab == "spark-tab")
    }

    @Test("Deprecated tabItem identifier")
    func deprecatedTabItemIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(TabAccessibilityIdentifier.tabItem == "spark-tab-item")
    }

    @Test("View and deprecated tab have same value")
    func viewAndDeprecatedTabHaveSameValue() {
        // GIVEN / WHEN / THEN
        #expect(TabAccessibilityIdentifier.view == TabAccessibilityIdentifier.tab)
    }
}
