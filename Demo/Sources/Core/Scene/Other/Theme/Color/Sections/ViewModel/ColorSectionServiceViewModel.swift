//
//  ColorSectionServiceViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct ColorSectionServiceViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initailization

    init(color: any ColorsService) {
        self.name = "Service"
        self.itemViewModels = [
            [
                .init(name: "service", colorToken: color.service),
                .init(name: "onService", colorToken: color.onService),
                .init(name: "serviceContainer", colorToken: color.serviceContainer),
                .init(name: "onServiceContainer", colorToken: color.onServiceContainer)
            ]
        ]
    }
}
