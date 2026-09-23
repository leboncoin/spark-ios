//
//  SparkCoreSnapshotTests.swift
//  SparkCoreTests
//
//  Created by luis.figueiredo-ext on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@_implementationOnly import SnapshotTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SwiftUI

// MARK: - UIKit snapshot example

final class SparkCoreUISnapshotTests: UIKitComponentSnapshotTestCase {

    func testDynamicContentSize() throws {
        let view = UILabel()
        view.text = "Hello world"
        view.font = .preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.translatesAutoresizingMaskIntoConstraints = false
        assertSnapshotInDarkAndLight(matching: view)
    }
}

// MARK: - SwiftUI snapshot example
final class SparkCoreSnapshotTests: SwiftUIComponentSnapshotTestCase {
    func testDynamicContentSize() throws {
        let view = Text("Hello world").fixedSize()
        assertSnapshotInDarkAndLight(matching: view)
    }
}
