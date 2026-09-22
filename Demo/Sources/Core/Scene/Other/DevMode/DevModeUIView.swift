//
//  DevModeUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct DevModeUIViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = DevModeUIViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        .init()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

// MARK: - View

final class DevModeUIViewController: UIViewController {

    // MARK: - View

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.label,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var label: UILabel = {
        let label = UILabel()
        label.text = "Replace me with your UI content"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - Properties

    var theme = DemoThemes.shared.mainTheme

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        // Add Subview
        self.view.addSubview(self.contentStackView)

        // Constraints
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self.view
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
