//
//  ComponentImplementationUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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
        uiView.layoutSubviews()
        uiView.layoutIfNeeded()
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
            self.componentStackView,
            self.infoLabelStackView,
            self.actionButton
        ].compactMap { $0 })
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = .init(spacing: .medium)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var componentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.componentView,
            UIView()
        ])
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var infoLabelStackView: UIStackView? = {
        guard let infoLabel else { return nil }

        let stackView = UIStackView(arrangedSubviews: [
            infoLabel
        ])
        stackView.layer.cornerRadius = .init(radius: .medium)
        stackView.backgroundColor = self.displayStyle == .alone ? .systemBackground : .systemGroupedBackground
        stackView.layoutMargins = .init(all: .small)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private(set) var componentView: ComponentView
    private(set) var infoLabel: UILabel?
    private(set) var actionButton: UIButton?

    // MARK: - Properties

    private(set) var configuration: Configuration
    private let contextType: ComponentContextType
    private let displayStyle: ComponentDisplayStyle?
    private let isFullWidth: Bool

    private var widthLayoutConstraint: NSLayoutConstraint?
    private var heightLayoutConstraint: NSLayoutConstraint?
    private var minHeightLayoutConstraint: NSLayoutConstraint?
    private var maxHeightLayoutConstraint: NSLayoutConstraint?
    private var trailingLayoutConstraint: NSLayoutConstraint?

    // MARK: - Initializer

    init(
        configuration: Configuration,
        componentView: ComponentView,
        contextType: ComponentContextType,
        displayStyle: ComponentDisplayStyle?,
        isFullWidth: Bool = false
    ) {
        self.configuration = configuration
        self.componentView = componentView
        if contextType.mayHaveOtherView {
            self.infoLabel = configuration.uiKitInfoLabel
        }
        if contextType.mayHaveOtherView {
            self.actionButton = configuration.uiKitActionButton
        }
        self.contextType = contextType
        self.displayStyle = displayStyle
        self.isFullWidth = isFullWidth
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
        self.contentStackView.demoBackground(self.configuration)

        self.infoLabel?.numberOfLines = 1
        self.infoLabel?.font = UIFont.systemFont(ofSize: 12)

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

        if self.isFullWidth {
            self.componentView.widthAnchor.constraint(equalTo: self.contentStackView.widthAnchor).isActive = true
        }

        // Constraints
        self.widthLayoutConstraint = self.contentStackView.widthAnchor.constraint(equalToConstant: 1)
        self.widthLayoutConstraint?.isActive = false

        self.heightLayoutConstraint = self.contentStackView.heightAnchor.constraint(equalToConstant: 1)
        self.heightLayoutConstraint?.isActive = false

        self.minHeightLayoutConstraint = self.contentStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1)
        self.minHeightLayoutConstraint?.isActive = false

        self.maxHeightLayoutConstraint = self.contentStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 1)
        self.maxHeightLayoutConstraint?.isActive = false

        self.trailingLayoutConstraint = self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.trailingLayoutConstraint?.isActive = false
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        self.reloadConstraints()
    }

    // MARK: - Constraints

    private func reloadConstraints() {
        // Width
        if self.frame.width > 0 {
            if self.isFullWidth || self.contentStackView.frame.size.width >= self.frame.width {
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

        // Height
        if self.frame.height > 0 {
            let componentMinHeight = self.intrinsicContentSize.height

            if let height = self.configuration.height.value(),
               height >= componentMinHeight {
                self.heightLayoutConstraint?.constant = height
                self.heightLayoutConstraint?.isActive = true
            } else {
                self.heightLayoutConstraint?.isActive = false
            }

            if let minHeight = self.configuration.height.minValue(),
               minHeight >= componentMinHeight {
                self.minHeightLayoutConstraint?.constant = minHeight
                self.minHeightLayoutConstraint?.isActive = true
            } else {
                self.minHeightLayoutConstraint?.isActive = false
            }

            if let maxHeight = self.configuration.height.maxValue(),
               maxHeight >= componentMinHeight {
                self.maxHeightLayoutConstraint?.constant = maxHeight
                self.maxHeightLayoutConstraint?.isActive = true
            } else {
                self.maxHeightLayoutConstraint?.isActive = false
            }
        }
    }

    // MARK: - Intrinsic Content Size

    override var intrinsicContentSize: CGSize {
        return .init(width: -1, height: CGFloat.maximum(self.componentView.frame.height, self.componentView.intrinsicContentSize.height))
    }
}
