//
//  DividerSeparatorWidthTypes.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 12/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

struct DividerSeparatorWidthTypes: Equatable {

    // MARK: - Properties

    var first: DividerSeparatorWidthType = .default
    var last: DividerSeparatorWidthType = .default

    // MARK: - Methods

    func value(for position: DividerSeparatorPosition) -> DividerSeparatorWidthType {
        switch position {
        case .first: self.first
        case .last: self.last
        }
    }
}
