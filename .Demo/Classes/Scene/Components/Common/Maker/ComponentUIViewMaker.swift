//
//  ComponentUIViewMaker.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

/// Used by UIKit components only
protocol ComponentUIViewMaker<ComponentView, Configuration> {

    // MARK: - Type Alias

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentView: UIView

    // MARK: - Static Properties

    static var fullWidth: Bool { get }

    // MARK: - Static Methods

    static func createComponentView(from configuration: Configuration) -> ComponentView

    static func updateComponentView(
        _ componentView: ComponentView,
        from configuration: Configuration
    )
}
