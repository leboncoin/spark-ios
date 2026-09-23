//
//  ChipAlignment.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 21.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The various alignment a chip may have.
public enum ChipAlignment: CaseIterable {
    /// Icon on the leading edge of the chip.
    /// Text on the trailing edge of the chip.
    /// Not interpreted if chip contains just an icon or just text.
    case leadingIcon
    /// Icon on the trailing edge of the chip.
    /// Text on the leading edge of the chip
    /// Not interpreted if the chip contains just an icon or just text.
    case trailingIcon

    // MARK: - Properties

    /// The default case. Equals to **.leadingIcon**.
    public static let `default`: Self = .leadingIcon
}
