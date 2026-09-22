//
//  StackAlignment.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum StackAlignment: String, CaseIterable {
    case center
    case leading
    case trailing
}

extension Alignment {

    init(_ alignment: StackAlignment) {
        switch alignment {
        case .center:
            self = .center
        case .leading:
            self = .leading
        case .trailing:
            self = .trailing
        }
    }
}
