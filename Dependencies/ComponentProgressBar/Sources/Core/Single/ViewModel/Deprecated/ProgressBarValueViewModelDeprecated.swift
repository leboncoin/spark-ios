//
//  ProgressBarValueViewModelDeprecated.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
protocol ProgressBarValueViewModelDeprecated {
    /// Function used to check if the value is valid or not
    /// - Parameter value: should be between 0...1
    /// - Returns: true if the value is valid otherwise false
    func isValidIndicatorValue(_ value: CGFloat) -> Bool
}

extension ProgressBarValueViewModelDeprecated {

    func isValidIndicatorValue(
        _ value: CGFloat
    ) -> Bool {
        return (0...1).contains(value)
    }
}
