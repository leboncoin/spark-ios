//
//  StarDefaults.swift
//  SparkComponentRating
//
//  Created by Michael Zimmermann on 04.12.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Default values
@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
public enum StarDefaults {
    public static let fillMode = StarFillMode.half
    public static let rating = CGFloat(0.0)
    public static let lineWidth = CGFloat(2.0)
}
