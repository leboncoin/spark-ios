//
//  NumberFormatter+SharedExtension.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension NumberFormatter {

    static let shared: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        formatter.positiveFormat = "#%"
        formatter.negativeFormat = "-#%"
        return formatter
    }()
}
