//
//  CaseIterable+NameExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension CaseIterable {

    // swiftlint:disable force_unwrapping
    static var random: Self {
        return self.allCases.randomElement()!
    }

    static var optionalRandom: Self? {
        return (1 == Int.random(in: 0...3)) ? nil : self.random
    }
}
