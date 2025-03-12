//
//  ComponentDisplayTableViewCell.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

// MARK: - Protocol

final class ComponentDisplayTableViewCell<
    Configuration: ComponentConfiguration,
    ComponentView: UIView,
    ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>,
    ViewMaker: ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView>
>: UITableViewCell {

    // MARK: - Components

    var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [UIView(), UIView()])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var componentView: ComponentImplementationUIView<ComponentView, Configuration>?
    var viewMaker: ViewMaker?

    // MARK: - Properties

    var configuration: Configuration? {
        didSet {
            self.updateView()
        }
    }

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Properties
        self.backgroundColor = .clear
        self.contentView.isUserInteractionEnabled = false

        // Subviews
        self.addSubview(self.contentStackView)

        // Add constraints
        self.setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self,
            insets: .init(all: .medium)
        )
    }

    // MARK: - Update

    private func updateView() {
        guard let configuration = self.configuration, let viewMaker else {
            return
        }

        // Create the component
        let componentView = viewMaker.createComponentImplementationView(
            for: configuration,
            context: .display
        )
        self.componentView = componentView

        // Remove the previous component in the stack view
        for view in self.contentStackView.arrangedSubviews.filter({
            $0 is ComponentImplementationUIView<ComponentView, Configuration>
        }) {
            self.contentStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        // Add the new component in the stack view
        self.contentStackView.insertArrangedSubview(componentView, at: 1) // Between the two spaces
    }
}
