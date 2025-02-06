//
//  ConfigurationViewable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

protocol ConfigurationViewable<Configuration>: View {
    associatedtype Configuration: ComponentConfiguration
    var configuration: Binding<Configuration> { get set }

    init(configuration: Binding<Configuration>)
}
