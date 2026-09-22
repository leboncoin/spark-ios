//
//  ColorSectionBusinessViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct ColorSectionBusinessViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initailization

    init(color: any ColorsBusiness) {
        self.name = "Business"
        self.itemViewModels = [
            [
                .init(name: "business", colorToken: color.business),
                .init(name: "onBusiness", colorToken: color.onBusiness),
                .init(name: "businessContainer", colorToken: color.businessContainer),
                .init(name: "onBusinessContainer", colorToken: color.onBusinessContainer)
            ]
        ]
    }
}
