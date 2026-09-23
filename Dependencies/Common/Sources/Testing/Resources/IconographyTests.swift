//
//  IconographyTests.swift
//  SparkCoreTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest

@_spi(SI_SPI) public struct IconographyTests {

    // MARK: - Shared

    public static var shared = IconographyTests()

    // MARK: - Initialize

    private init() {}

    // MARK: - Icons

    public lazy var arrow: UIImage = {
        return self.getImage(name: "arrow")
    }()

    public lazy var checkmark: UIImage = {
        return self.getImage(name: "checkbox-selected")
    }()

    public lazy var switchOff: UIImage = {
        return self.getImage(name: "switchOff")
    }()

    public lazy var switchOn: UIImage = {
        return self.getImage(name: "switchOn")
    }()

    // MARK: - Helper

    private func getImage(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: .module, with: nil) else {
            fatalError("no image found for \(name)")
        }
        return image
    }
}
