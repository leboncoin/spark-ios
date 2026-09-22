//
//  TabIntent.swift
//  SparkComponentTab
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// `TabIntent` determines the color of the tab tint color.
public enum TabIntent: CaseIterable {
    case main
    case support

    // MARK: - Properties

    /// The defautl value. Equals to **.support**
    public static let `default`: TabIntent = .support
}
