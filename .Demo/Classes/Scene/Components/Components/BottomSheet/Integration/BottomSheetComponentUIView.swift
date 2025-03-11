//
//  BottomSheetComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias BottomSheetComponentUIViewController = ComponentDisplayViewControllerRepresentable<BottomSheetConfiguration, UIButton, BottomSheetConfigurationView, BottomSheetComponentUIViewMaker>

extension BottomSheetComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class BottomSheetComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = BottomSheetConfiguration
    typealias ComponentView = UIButton
    typealias ConfigurationView = BottomSheetConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, BottomSheetComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let button = UIButton(configuration: .filled())
        button.setTitle("Show BottomSheet", for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.actionHandler(on: button, configuration: configuration)
        }), for: .touchUpInside)

        self.updateCommonProperties(button, for: configuration)
        return button
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        configuration.uiKitInfoLabel?.text = configuration.contentType.description
    }

    // MARK: - Actions

    private func actionHandler(
        on componentView: ComponentView,
        configuration: Configuration
    ) {
        guard let viewController else {
            return
        }

        let controller = BottomSheetContentViewController(configuration: configuration)
        let detents: [UISheetPresentationController.Detent]
        if #available(iOS 16.0, *) {
            detents = [
                .medium(),
                .maxHeight(),
                configuration.contentType.isScrollView ? .expandedHeight(of: controller.view) : .compressedHeight(of: controller.view)
            ]
        } else {
            detents = [.medium(), .large()]
        }
        if let sheet = controller.sheetPresentationController {
            sheet.detents = detents
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            if #available(iOS 17.0, *) {
                sheet.prefersPageSizing = true
            }
            sheet.prefersGrabberVisible = true
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }

        let parentViewController = viewController.presentedViewController ?? viewController
        parentViewController.present(controller, animated: true)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }

    func isInfoLabel() -> Bool {
        true
    }
}

// MARK: - BottomSheet Content

private final class BottomSheetContentViewController: UIViewController {

    // MARK: - View

    lazy var contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(self.contentStackView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            self.textLabel,
            UIView(),
            self.button
        ])
        stackView.axis = .vertical
        stackView.spacing = Spacing.medium.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bottom Sheet"
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = self.configuration.contentType.text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Dismiss", for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Properties

    let configuration: BottomSheetConfiguration

    // MARK: - Initialization

    init(configuration: BottomSheetConfiguration) {
        self.configuration = configuration

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life view cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(self.contentScrollView)

        NSLayoutConstraint.activate([
            self.contentStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -Spacing.medium.rawValue * 2),
            self.contentScrollView.heightAnchor.constraint(greaterThanOrEqualToConstant: self.configuration.contentType.minHeight)
        ])

        NSLayoutConstraint.stickEdges(from: self.contentScrollView, to: self.view, insets: .init(all: .medium))
        NSLayoutConstraint.stickEdges(from: self.contentStackView, to: self.contentScrollView)
    }
}
