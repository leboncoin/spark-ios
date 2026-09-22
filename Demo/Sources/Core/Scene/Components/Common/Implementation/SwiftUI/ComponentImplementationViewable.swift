//
//  ComponentImplementationViewable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

protocol ComponentImplementationViewable<C>: View {
    associatedtype C: ComponentConfiguration
    var configuration: Binding<C> { get set }

    init(configuration: Binding<C>)
}

extension ComponentImplementationViewable {

    var configurationWrapped: C {
        self.configuration.wrappedValue
    }
}
