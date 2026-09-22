//
//  ColorSectionAIViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct ColorSectionAIViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initailization

    init(color: any ColorsAI) {
        self.name = "AI"
        self.itemViewModels = [
            [
                .init(name: "ai", colorToken: color.ai),
                .init(name: "onAI", colorToken: color.onAI),
                .init(name: "aiContainer", colorToken: color.aiContainer),
                .init(name: "onAIContainer", colorToken: color.onAIContainer)
            ]
        ]
    }
}
