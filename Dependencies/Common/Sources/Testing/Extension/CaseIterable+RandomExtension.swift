//
//  CaseIterable+RandomExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) public extension CaseIterable where Self: Equatable {

    /// Get an another random value from the current value.
    var otherRandom: Self {
        // swiftlint:disable force_unwrapping
        return Self.allCases.filter { $0 != self }.randomElement()!
    }
}
