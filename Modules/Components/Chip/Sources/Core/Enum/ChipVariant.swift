//
//  ChipVariant.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 02.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The different variants of a chip
public enum ChipVariant: CaseIterable {
    case dashed
    case outlined
    case tinted

    // MARK: - Properties

    /// The default case. Equals to **.tinted**.
    public static let `default`: Self = .tinted
}
