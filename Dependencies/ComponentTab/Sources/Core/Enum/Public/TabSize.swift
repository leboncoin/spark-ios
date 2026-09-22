//
//  TabSize.swift
//  SparkComponentTab
//
//  Created by michael.zimmermann on 02.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The size of the content of the tabs
public enum TabSize: CaseIterable {
    case xSmall
    case small
    case medium

    @available(*, deprecated, message: "Not used anymore by SparkTab or SparkUITab. Replaced by .xSmall.")
    case xs
    @available(*, deprecated, message: "Not used anymore by SparkTab or SparkUITab. Replaced by .small.")
    case sm
    @available(*, deprecated, message: "Not used anymore by SparkTab or SparkUITab. Replaced by .medium.")
    case md

    // MARK: - Properties

    public static var allCases: [TabSize] = [
        .xSmall,
        .small,
        .medium
    ]

    /// The defautl value. Equals to **.medium**
    public static let `default`: TabSize = .medium
}
