//
//  CloseRangeFloat+CastExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

extension ClosedRange<Float> {

    var intRange: ClosedRange<Int> {
        Int(self.lowerBound)...Int(self.upperBound)
    }

    var doubleRange: ClosedRange<Double> {
        Double(self.lowerBound)...Double(self.upperBound)
    }
}
