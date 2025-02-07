//
//  ComponentImplementationUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Representable

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

// MARK: - View

final class ComponentImplementationUIView<
    ComponentView: UIView,
    Configuration: ComponentConfiguration
>: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.componentView,
            UIView()
        ])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private(set) var componentView: ComponentView

    // MARK: - Properties

    private(set) var configuration: Configuration
    private let contextType: ComponentContextType
    private let fullWidth: Bool

    private var widthLayoutConstraint: NSLayoutConstraint?
    private var trailingLayoutConstraint: NSLayoutConstraint?

    // MARK: - Initializer

    init(
        configuration: Configuration,
        componentView: ComponentView,
        contextType: ComponentContextType,
        fullWidth: Bool = false
    ) {
        self.configuration = configuration
        self.componentView = componentView
        self.contextType = contextType
        self.fullWidth = fullWidth
        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Properties
        self.backgroundColor = .clear

        // Subviews
        self.addSubview(self.contentStackView)

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        if self.fullWidth {
            self.componentView.widthAnchor.constraint(equalTo: self.contentStackView.widthAnchor).isActive = true
        }

        // Constraints
        self.widthLayoutConstraint = self.contentStackView.widthAnchor.constraint(equalToConstant: 1)
        self.widthLayoutConstraint?.isActive = false

        self.trailingLayoutConstraint = self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.trailingLayoutConstraint?.isActive = false
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.reloadConstraints()
    }

    override func setNeedsLayout() {
        super.setNeedsLayout()

        self.reloadConstraints()
    }

    // MARK: - Constraints

    private func reloadConstraints() {
        guard self.frame.width > 0 else {
            return
        }

        if self.fullWidth || self.contentStackView.frame.size.width >= self.frame.width {
            self.widthLayoutConstraint?.constant = self.frame.width
            self.widthLayoutConstraint?.isActive = true
            self.trailingLayoutConstraint?.isActive = false

        } else {
            switch self.contextType {
            case .display:
                self.widthLayoutConstraint?.isActive = false
                self.trailingLayoutConstraint?.isActive = false

            case .configuration:
                self.widthLayoutConstraint?.isActive = false
                self.trailingLayoutConstraint?.isActive = true
            }
        }
    }

    // MARK: - Intrinsic Content Size

    override var intrinsicContentSize: CGSize {
        return .init(width: -1, height: self.componentView.frame.height)
    }
}
