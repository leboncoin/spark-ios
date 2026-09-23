//
//  ColorSectionNewViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct ColorSectionNewViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initailization

    init(color: any ColorsNew) {
        self.name = "New"
        self.itemViewModels = [
            [
                .init(name: "new", colorToken: color.new),
                .init(name: "onNew", colorToken: color.onNew),
                .init(name: "newContainer", colorToken: color.newContainer),
                .init(name: "onNewContainer", colorToken: color.onNewContainer)
            ]
        ]
    }
}
