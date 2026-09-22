//
//  Int+ConvertedValue.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Int {

    func converted(_ unit: String?) -> String? {
        guard let self else {
            return nil
        }

        let maxValue = 99
        let string = String(self > maxValue ? maxValue : self)

        if let unit {
            return string + unit
        } else {
            return string
        }
    }
}
