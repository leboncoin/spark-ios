//
//  ColorSectionStatesViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

struct ColorSectionStatesViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initialization

    init(color: any ColorsStates) {
        self.name = "States"
        self.itemViewModels = [
            [
                .init(name: "mainPressed", colorToken: color.mainPressed),
                .init(name: "mainVariantPressed", colorToken: color.mainVariantPressed),
                .init(name: "mainContainerPressed", colorToken: color.mainContainerPressed),
                .init(name: "supportPressed", colorToken: color.supportPressed),
                .init(name: "supportVariantPressed", colorToken: color.supportVariantPressed),
                .init(name: "supportContainerPressed", colorToken: color.supportContainerPressed),
                .init(name: "accentPressed", colorToken: color.accentPressed),
                .init(name: "accentVariantPressed", colorToken: color.accentVariantPressed),
                .init(name: "accentContainerPressed", colorToken: color.accentContainerPressed),
                .init(name: "surfacePressed", colorToken: color.surfacePressed),
                .init(name: "surfaceInversePressed", colorToken: color.surfaceInversePressed),
                .init(name: "surfaceDarkPressed", colorToken: color.surfaceDarkPressed),
                .init(name: "successPressed", colorToken: color.successPressed),
                .init(name: "successContainerPressed", colorToken: color.successContainerPressed),
                .init(name: "alertPressed", colorToken: color.alertPressed),
                .init(name: "alertContainerPressed", colorToken: color.alertContainerPressed),
                .init(name: "errorPressed", colorToken: color.errorPressed),
                .init(name: "errorContainerPressed", colorToken: color.errorContainerPressed),
                .init(name: "infoPressed", colorToken: color.infoPressed),
                .init(name: "infoContainerPressed", colorToken: color.infoContainerPressed),
                .init(name: "neutralPressed", colorToken: color.neutralPressed),
                .init(name: "neutralContainerPressed", colorToken: color.neutralContainerPressed),
                .init(name: "aiPressed", colorToken: color.aiPressed),
                .init(name: "aiContainerPressed", colorToken: color.aiContainerPressed),
                .init(name: "focusPressed", colorToken: color.focusPressed),
                .init(name: "focusContainerPressed", colorToken: color.focusContainerPressed),
                .init(name: "newPressed", colorToken: color.newPressed),
                .init(name: "newContainerPressed", colorToken: color.newContainerPressed),
                .init(name: "businessPressed", colorToken: color.businessPressed),
                .init(name: "businessContainerPressed", colorToken: color.businessContainerPressed),
                .init(name: "servicePressed", colorToken: color.servicePressed),
                .init(name: "serviceContainerPressed", colorToken: color.serviceContainerPressed)
            ]
        ]
    }
}
