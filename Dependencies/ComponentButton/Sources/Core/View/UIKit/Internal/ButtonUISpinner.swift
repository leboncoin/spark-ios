//
//  ButtonUISpinner.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 19/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkComponentSpinner

final class ButtonUISpinner: UIView {

    // MARK: - Components

    private lazy var spinner: SparkUISpinner = {
        let spinner = SparkUISpinner(theme: self.theme)
        spinner.size = .onButton
        return spinner
    }()

    // MARK: - Properties

    var theme: any Theme {
        didSet {
            self.spinner.theme = self.theme
        }
    }

    var intent: SpinnerIntent {
        get {
            self.spinner.intent
        }
        set {
            self.spinner.intent = newValue
        }
    }

    private var imageHeightConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private func setupView() {
        // Add subviews
        self.addSubview(self.spinner)

        // Setup constraints
        self.setupConstraints()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupStepperViewConstraints()
    }

    private func setupStepperViewConstraints() {
        self.spinner.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            self.widthAnchor.constraint(greaterThanOrEqualTo: self.spinner.widthAnchor),
            self.heightAnchor.constraint(greaterThanOrEqualTo: self.spinner.heightAnchor)
        ])
    }
}
