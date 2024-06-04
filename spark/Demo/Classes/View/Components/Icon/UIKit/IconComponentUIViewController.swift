//
//  IconComponentUIViewController.swift
//  Spark
//
//  Created by alican.aycil on 28.08.23.
//  Copyright (c) 2023 Adevinta. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import Combine
import Spark
import SwiftUI
import UIKit
@_spi(SI_SPI) import SparkCommon

final class IconComponentUIViewController: UIViewController {

    // MARK: - Published Properties
    @ObservedObject private var themePublisher = SparkThemePublisher.shared

    // MARK: - Properties
    let componentView: IconComponentUIView
    let viewModel: IconComponentUIViewModel
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initializer
    init(viewModel: IconComponentUIViewModel) {
        self.viewModel = viewModel
        self.componentView = IconComponentUIView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = componentView
    }

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Icon"
        addPublisher()
    }

    // MARK: - Add Publishers
    private func addPublisher() {

        self.themePublisher
            .$theme
            .sink { [weak self] theme in
                guard let self = self else { return }
                self.viewModel.theme = theme
                self.navigationController?.navigationBar.tintColor = theme.colors.main.main.uiColor
            }
            .store(in: &self.cancellables)

        self.viewModel.showThemeSheet.subscribe(in: &self.cancellables) { intents in
            self.presentThemeActionSheet(intents)
        }

        self.viewModel.showIntentSheet.subscribe(in: &self.cancellables) { intents in
            self.presentIntentActionSheet(intents)
        }

        self.viewModel.showSizeSheet.subscribe(in: &self.cancellables) { intents in
            self.presentSizeActionSheet(intents)
        }
    }
}

// MARK: - Builder
extension IconComponentUIViewController {

    static func build() -> IconComponentUIViewController {
        let viewModel = IconComponentUIViewModel(theme: SparkThemePublisher.shared.theme)
        let viewController = IconComponentUIViewController(viewModel: viewModel)
        return viewController
    }
}

// MARK: - Navigation
extension IconComponentUIViewController {

    private func presentThemeActionSheet(_ themes: [ThemeCellModel]) {
        let actionSheet = SparkActionSheet<Theme>.init(
            values: themes.map { $0.theme },
            texts: themes.map { $0.title }) { theme in
                self.themePublisher.theme = theme
            }
        self.present(actionSheet, isAnimated: true)
    }

    private func presentIntentActionSheet(_ intents: [IconIntent]) {
        let actionSheet = SparkActionSheet<IconIntent>.init(
            values: intents,
            texts: intents.map { $0.name }) { intent in
                self.viewModel.intent = intent
            }
        self.present(actionSheet, isAnimated: true)
    }

    private func presentSizeActionSheet(_ sizes: [IconSize]) {
        let actionSheet = SparkActionSheet<IconSize>.init(
            values: sizes,
            texts: sizes.map { $0.name }) { size in
                self.viewModel.size = size
            }
        self.present(actionSheet, isAnimated: true)
    }
}
