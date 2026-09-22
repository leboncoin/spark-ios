//
//  ColorSectionMainViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

struct ColorSectionMainViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initialization

    init(color: any ColorsMain) {
        self.name = "Main"
        self.itemViewModels = [
            [
                .init(name: "main", colorToken: color.main),
                .init(name: "onMain", colorToken: color.onMain),
                .init(name: "mainVariant", colorToken: color.mainVariant),
                .init(name: "onMainVariant", colorToken: color.onMainVariant),
                .init(name: "mainContainer", colorToken: color.mainContainer),
                .init(name: "onMainContainer", colorToken: color.onMainContainer)
            ]
        ]
    }
}
