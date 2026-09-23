//
//  ColorSectionFocusViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct ColorSectionFocusViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initailization

    init(color: any ColorsFocus) {
        self.name = "Focus"
        self.itemViewModels = [
            [
                .init(name: "focus", colorToken: color.focus),
                .init(name: "onFocus", colorToken: color.onFocus),
                .init(name: "focusContainer", colorToken: color.focusContainer),
                .init(name: "onFocusContainer", colorToken: color.onFocusContainer)
            ]
        ]
    }
}
