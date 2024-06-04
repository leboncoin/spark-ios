//
//  SpinnerComponentUIViewModel.swift
//  Spark
//
//  Created by alican.aycil on 28.08.23.
//  Copyright (c) 2023 Adevinta. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import Combine
@_spi(SI_SPI) import SparkCommon
import Spark
import UIKit

final class SpinnerComponentUIViewModel: ObservableObject {

    // MARK: - Published Properties
    var showThemeSheet: AnyPublisher<[ThemeCellModel], Never> {
        showThemeSheetSubject
            .eraseToAnyPublisher()
    }

    var showIntentSheet: AnyPublisher<[SpinnerIntent], Never> {
        showIntentSheetSubject
            .eraseToAnyPublisher()
    }

    var showSizeSheet: AnyPublisher<[SpinnerSize], Never> {
        showSizeSheetSubject
            .eraseToAnyPublisher()
    }

    let themes = ThemeCellModel.themes

    // MARK: - Private Properties
    private var showThemeSheetSubject: PassthroughSubject<[ThemeCellModel], Never> = .init()
    private var showIntentSheetSubject: PassthroughSubject<[SpinnerIntent], Never> = .init()
    private var showSizeSheetSubject: PassthroughSubject<[SpinnerSize], Never> = .init()

    // MARK: - Initialization
    @Published var theme: Theme
    @Published var intent: SpinnerIntent
    @Published var size: SpinnerSize

    init(
        theme: Theme,
        intent: SpinnerIntent = .main,
        size: SpinnerSize = .medium
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size
    }
}

// MARK: - Navigation
extension SpinnerComponentUIViewModel {

    @objc func presentThemeSheet() {
        self.showThemeSheetSubject.send(themes)
    }

    @objc func presentIntentSheet() {
        self.showIntentSheetSubject.send(SpinnerIntent.allCases)
    }

    @objc func presentSizeSheet() {
        self.showSizeSheetSubject.send(SpinnerSize.allCases)
    }
}
