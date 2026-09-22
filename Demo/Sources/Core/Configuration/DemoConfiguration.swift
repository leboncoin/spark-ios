//
//  DemoConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation
import UIKit

public struct DemoConfiguration {

    // MARK: - Subclass

    private class Class {}

    // MARK: - Public Properties

    public static var isDevMode = true

    // MARK: - Properties

    private static var didLoad = false

    // MARK: - Static func

    public static func load() {
        guard !self.didLoad else { return }
        self.didLoad = true

        Bundle.registerAllFonts()
    }
}
