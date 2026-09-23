//
//  BorderViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

final class BorderViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var sectionViewModels = [BorderSectionViewModel]()

    var theme: (any Theme)? {
        didSet {
            self.updateSectionViewModels()
        }
    }

    // MARK: - Methods

    private func updateSectionViewModels() {
        guard let border = self.theme?.border else {
            return
        }

        self.sectionViewModels = [
            .init(name: "none width",
                  itemViewModels: [
                    .init(name: "none", width: border.width.none, radius: border.radius.none),
                    .init(name: "small", width: border.width.none, radius: border.radius.small),
                    .init(name: "medium", width: border.width.none, radius: border.radius.medium),
                    .init(name: "large", width: border.width.none, radius: border.radius.large),
                    .init(name: "xLarge", width: border.width.none, radius: border.radius.xLarge),
                    .init(name: "full", width: border.width.none, radius: border.radius.full)
                  ]),

                .init(name: "small width",
                      itemViewModels: [
                        .init(name: "none", width: border.width.small, radius: border.radius.none),
                        .init(name: "small", width: border.width.small, radius: border.radius.small),
                        .init(name: "medium", width: border.width.small, radius: border.radius.medium),
                        .init(name: "large", width: border.width.small, radius: border.radius.large),
                        .init(name: "xLarge", width: border.width.small, radius: border.radius.xLarge),
                        .init(name: "full", width: border.width.small, radius: border.radius.full)
                      ]),

                .init(name: "medium width",
                      itemViewModels: [
                        .init(name: "none", width: border.width.medium, radius: border.radius.none),
                        .init(name: "small", width: border.width.medium, radius: border.radius.small),
                        .init(name: "medium", width: border.width.medium, radius: border.radius.medium),
                        .init(name: "large", width: border.width.medium, radius: border.radius.large),
                        .init(name: "xLarge", width: border.width.medium, radius: border.radius.xLarge),
                        .init(name: "full", width: border.width.medium, radius: border.radius.full)
                      ]),

                .init(name: "isHighlighted",
                      itemViewModels: [
                        .init(name: "none width", width: border.width.none, radius: border.radius.large, isHighlighted: true),
                        .init(name: "small width", width: border.width.small, radius: border.radius.large, isHighlighted: true),
                        .init(name: "medium width", width: border.width.medium, radius: border.radius.large, isHighlighted: true),
                      ])
        ]
    }
}
