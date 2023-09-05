//
//  SpinnerComponentUIViewController.swift
//  Spark
//
//  Created by alican.aycil on 28.08.23.
//  Copyright (c) 2023 Adevinta. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import Combine
import Spark
import SparkCore
import SwiftUI
import UIKit

final class SpinnerComponentUIViewController: UIViewController {

    // MARK: - Published Properties
    @ObservedObject private var themePublisher = SparkThemePublisher.shared

    // MARK: - Properties
    let componentView: SpinnerComponentUIView
    let viewModel: SpinnerComponentUIViewModel
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initializer
    init(viewModel: SpinnerComponentUIViewModel) {
        self.viewModel = viewModel
        self.componentView = SpinnerComponentUIView(viewModel: viewModel)
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
        self.navigationItem.title = "Spinner"
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
extension SpinnerComponentUIViewController {

    static func build() -> SpinnerComponentUIViewController {
        let viewModel = SpinnerComponentUIViewModel(theme: SparkThemePublisher.shared.theme)
        let viewController = SpinnerComponentUIViewController(viewModel: viewModel)
        return viewController
    }
}

// MARK: - Navigation
extension SpinnerComponentUIViewController {

    private func presentThemeActionSheet(_ themes: [ThemeCellModel]) {
        let actionSheet = SparkActionSheet<Theme>.init(
            values: themes.map { $0.theme },
            texts: themes.map { $0.title }) { theme in
                self.themePublisher.theme = theme
            }
        self.present(actionSheet, animated: true)
    }

    private func presentIntentActionSheet(_ intents: [SpinnerIntent]) {
        let actionSheet = SparkActionSheet<SpinnerIntent>.init(
            values: intents,
            texts: intents.map { $0.name }) { intent in
                self.viewModel.intent = intent
            }
        self.present(actionSheet, animated: true)
    }

    private func presentSizeActionSheet(_ sizes: [SpinnerSize]) {
        let actionSheet = SparkActionSheet<SpinnerSize>.init(
            values: sizes,
            texts: sizes.map { $0.name }) { size in
                self.viewModel.size = size
            }
        self.present(actionSheet, animated: true)
    }
}
