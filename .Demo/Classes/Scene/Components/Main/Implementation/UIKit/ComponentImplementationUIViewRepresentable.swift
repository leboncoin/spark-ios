//
//  ComponentImplementationUIViewRepresentable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ComponentImplementationUIViewRepresentable<
    ComponentView: UIView,
    Configuration: ComponentConfiguration
>: UIViewRepresentable, ComponentImplementationViewable {

    // MARK: - Type Alias

    typealias UIViewType = ComponentImplementationUIView<ComponentView, Configuration>

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var component: UIViewType

    // MARK: - Initialization

    /// This init is not used for UIKit component.
    init(configuration: Binding<Configuration>) {
        fatalError("Init without component is not authorized")
    }

    init(configuration: Binding<Configuration>, component: UIViewType) {
        self.configuration = configuration
        self.component = component
    }

    // MARK: - Make View

    func makeUIView(context: Context) -> UIViewType {
        self.component.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.component.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return self.component
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.invalidateIntrinsicContentSize()
    }
}
