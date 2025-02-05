//
//  ComponentImplementationUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit

final class ComponentImplementationUIView<
    ComponentView: UIView,
    Configuration: ComponentConfiguration
>: UIView {

    // MARK: - Components

    private(set) var componentView: ComponentView

    // MARK: - Properties

    private var configuration: Configuration
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
        self.addSubview(self.componentView)

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.componentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.componentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.componentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        // Constraints
        self.widthLayoutConstraint = self.componentView.widthAnchor.constraint(equalToConstant: 1)
        self.widthLayoutConstraint?.isActive = false

        self.trailingLayoutConstraint = self.componentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.trailingLayoutConstraint?.isActive = false
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        guard self.frame.width > 0 else {
            return
        }

        if self.fullWidth || self.componentView.frame.size.width >= self.frame.width {
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
