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
    var componentImplementationView: UIViewType

    // MARK: - Initialization

    /// This init is not used for UIKit component.
    init(configuration: Binding<Configuration>) {
        fatalError("Init without component is not authorized")
    }

    init(configuration: Binding<Configuration>, componentImplementationView: UIViewType) {
        self.configuration = configuration
        self.componentImplementationView = componentImplementationView
    }

    // MARK: - Make View

    func makeUIView(context: Context) -> UIViewType {
        self.componentImplementationView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.componentImplementationView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return self.componentImplementationView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.invalidateIntrinsicContentSize()
    }
}
