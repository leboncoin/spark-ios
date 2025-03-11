//
//  PopoverComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias PopoverComponentUIViewController = ComponentDisplayViewControllerRepresentable<PopoverConfiguration, UIButton, PopoverConfigurationView, PopoverComponentUIViewMaker>

extension PopoverComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class PopoverComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = PopoverConfiguration
    typealias ComponentView = UIButton
    typealias ConfigurationView = PopoverConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, PopoverComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let button = UIButton(configuration: .filled())
        button.setTitle("Show popover", for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.actionHandler(on: button, configuration: configuration)
        }), for: .touchUpInside)
        return button
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        // Nothing to do here
    }

    // MARK: - Actions

    private func actionHandler(
        on componentView: ComponentView,
        configuration: Configuration
    ) {
        guard let viewController else {
            return
        }

        let popoverViewController = PopoverViewController(
            contentViewController: PopoverContentViewController(configuration: configuration),
            theme: configuration.theme.value,
            intent: configuration.intent,
            showArrow: configuration.uiKitShowArrow
        )

        viewController.presentPopover(
            popoverViewController,
            sourceView: componentView
        )
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Popover Content

private final class PopoverContentViewController: UIViewController {

    // MARK: - View

    let label: UILabel = {
        let label = UILabel()
        label.text = "This is a label that should be multiline, depending on the content size. This is a label that should be multiline, depending on the content size."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization

    init(configuration: PopoverConfiguration) {
        super.init(nibName: nil, bundle: nil)

        self.label.textColor = configuration.intent.getColors(theme: configuration.theme.value).foreground.uiColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life view cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear

        self.view.addSubview(self.label)

        NSLayoutConstraint.stickEdges(from: self.label, to: self.view)
        self.label.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
    }

    override func viewDidLayoutSubviews() {
        self.preferredContentSize = self.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
