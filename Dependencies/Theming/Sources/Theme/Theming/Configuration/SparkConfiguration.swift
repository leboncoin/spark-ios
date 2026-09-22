//
//  SparkConfiguration.swift
//  SparkTheme
//
//  Created by robin.lemaire on 02/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation
import UIKit

public struct SparkConfiguration {

    // MARK: - Subclass

    private class Class {}

    private static var didLoad = false

    // MARK: - static func

    public static func load() {
        guard !self.didLoad else { return }
        self.didLoad = true

        Bundle.registerAllFonts()
    }
}
