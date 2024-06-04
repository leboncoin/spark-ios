//
//  IconComponentUIView.swift
//  Spark
//
//  Created by alican.aycil on 28.08.23.
//  Copyright (c) 2023 Adevinta. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//


import Combine
import Spark
import UIKit
@_spi(SI_SPI) import SparkCommon

final class IconComponentUIView: UIView {

    private lazy var configurationLabel: UILabel = {
        let label = UILabel()
        label.text = "Configuration"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Theme:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private lazy var themeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(self.viewModel.theme.colors.main.main.uiColor, for: .normal)
        button.addTarget(self.viewModel, action: #selector(viewModel.presentThemeSheet), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()

    private lazy var themeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [themeLabel, themeButton, UIView()])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()

    private lazy var intentLabel: UILabel = {
        let label = UILabel()
        label.text = "Intent:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private lazy var intentButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(self.viewModel.theme.colors.main.main.uiColor, for: .normal)
        button.addTarget(self.viewModel, action: #selector(viewModel.presentIntentSheet), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()

    private lazy var intentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [intentLabel, intentButton, UIView()])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()

    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Size:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private lazy var sizeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(self.viewModel.theme.colors.main.main.uiColor, for: .normal)
        button.addTarget(self.viewModel, action: #selector(viewModel.presentSizeSheet), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()

    private lazy var sizeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sizeLabel, sizeButton, UIView()])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()

    private lazy var configurationStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                themeStackView,
                intentStackView,
                sizeStackView
            ]
        )
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var integrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Integration"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var iconView: IconUIView = {
        let view = IconUIView(
            iconImage: self.viewModel.iconImage,
            theme: self.viewModel.theme,
            intent: self.viewModel.intent,
            size: self.viewModel.size
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Properties
    private let viewModel: IconComponentUIViewModel
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initializer
    init(viewModel: IconComponentUIViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        self.setupView()
        self.addPublishers()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views
    private func setupView() {
        self.backgroundColor = UIColor.systemBackground

        addSubview(configurationLabel)
        addSubview(configurationStackView)
        addSubview(lineView)
        addSubview(integrationLabel)
        addSubview(iconView)

        NSLayoutConstraint.activate([
            configurationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            configurationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            configurationStackView.topAnchor.constraint(equalTo: configurationLabel.bottomAnchor, constant: 16),
            configurationStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            configurationStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            lineView.topAnchor.constraint(equalTo: configurationStackView.bottomAnchor, constant: 16),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 1),

            integrationLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            integrationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            iconView.topAnchor.constraint(equalTo: integrationLabel.bottomAnchor, constant: 16),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }

    // MARK: - Publishers
    private func addPublishers() {

        self.viewModel.$theme.subscribe(in: &self.cancellables) { [weak self] theme in
            guard let self = self else { return }
            let color = self.viewModel.theme.colors.main.main.uiColor
            let themeTitle: String? = theme is SparkTheme ? self.viewModel.themes.first?.title : self.viewModel.themes.last?.title
            self.themeButton.setTitle(themeTitle, for: .normal)
            self.themeButton.setTitleColor(color, for: .normal)
            self.intentButton.setTitleColor(color, for: .normal)
            self.sizeButton.setTitleColor(color, for: .normal)
            self.iconView.theme = theme
        }

        self.viewModel.$intent.subscribe(in: &self.cancellables) { [weak self] intent in
            guard let self = self else { return }
            self.intentButton.setTitle(intent.name, for: .normal)
            self.iconView.intent = intent
        }

        self.viewModel.$size.subscribe(in: &self.cancellables) { [weak self] size in
            guard let self = self else { return }
            self.sizeButton.setTitle(size.name, for: .normal)
            self.iconView.size = size
        }
    }
}
