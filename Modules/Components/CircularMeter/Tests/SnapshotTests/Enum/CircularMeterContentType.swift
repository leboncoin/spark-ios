//
//  CircularMeterContentType.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

enum CircularMeterContentType: String, CaseIterable {
    case native
    case custom

    static var `default` = Self.native

    func name(for value: String) -> String {
        switch self {
        case .native: value
        case .custom: value + "Custom"
        }
    }
}
