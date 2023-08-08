//
//  TabItemUIViewSnapshotTests.swift
//  SparkCoreTests
//
//  Created by michael.zimmermann on 02.08.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

@testable import Spark
@testable import SparkCore
import XCTest

final class TabItemUIViewSnapshotTests: UIKitComponentTestCase {
    let theme = SparkTheme.shared
    var image: UIImage!

    override func setUp() {
        super.setUp()

        self.image = UIImage(systemName: "folder")!
    }

    // MARK: - Tests
    func test_tab_with_image() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            text: "Label",
            icon: self.image)

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_selected_tab_with_intent_support() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .support,
            text: "Label",
            icon: self.image)

        sut.isSelected = true

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.large])
    }

    func test_selected_tab_with_intent_main() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            text: "Label",
            icon: self.image)
        sut.isSelected = true

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.large])
    }

    func test_with_image_only() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            icon: self.image)

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_with_label_only() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            text: "Label")

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_with_label_and_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            text: "Label")

        let badge = BadgeUIView(theme: self.theme, intent: .danger, value: 99)
        sut.badge = badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_with_icon_and_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            icon: self.image)

        let badge = BadgeUIView(theme: self.theme, intent: .danger, value: 99)
        sut.badge = badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_with_icon_label_and_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            text: "Label",
            icon: self.image)

        let badge = BadgeUIView(theme: self.theme, intent: .danger, value: 99)
        sut.badge = badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }
}
