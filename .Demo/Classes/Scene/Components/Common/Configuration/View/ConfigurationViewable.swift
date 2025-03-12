//
//  ConfigurationViewable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

protocol ConfigurationViewable<Configuration>: View {

    // MARK: - Associated Type

    associatedtype Configuration: ComponentConfiguration

    // MARK: - Properties

    var configuration: Binding<Configuration> { get set }

    // MARK: - Initialization

    init(configuration: Binding<Configuration>)
}

// MARK: - For UIKit only

protocol ConfigurationUIViewable<Configuration, ComponentUIView>: View {

    // MARK: - Associated Type

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentUIView: UIView
    typealias ComponentImplementationRepresentable = ComponentImplementationUIViewRepresentable<ComponentUIView, Configuration>

    // MARK: - Properties

    var componentImplementationViewRepresentable: ComponentImplementationRepresentable? { get set }

    // MARK: - Initialization

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    )
}

extension ConfigurationUIViewable {

    var framework: Framework {
        self.componentImplementationViewRepresentable != nil ? .uiKit : .swiftUI
    }
}
