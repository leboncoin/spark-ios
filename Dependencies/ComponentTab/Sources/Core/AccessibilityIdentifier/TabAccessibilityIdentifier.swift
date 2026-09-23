//
//  TabAccessibilityIdentifier.swift
//  SparkComponentTab
//
//  Created by michael.zimmermann on 04.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public enum TabAccessibilityIdentifier {

    // MARK: - Properties

    public static let view = "spark-tab"
    public static func item(at index: Int) ->  String {
        "spark-tab-item-\(index)"
    }

    @available(*, deprecated, message: "Not used anymore by SparkTab or SparkUITab")
    public static let tabItem = "spark-tab-item"
    @available(*, deprecated, message: "Not used anymore by SparkTab or SparkUITab")
    public static let tab = "spark-tab"
}
