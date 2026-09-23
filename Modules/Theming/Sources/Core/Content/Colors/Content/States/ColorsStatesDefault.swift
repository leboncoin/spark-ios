//
//  ColorsStatesDefault.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public struct ColorsStatesDefault: ColorsStates {

    // MARK: - Properties

    public let mainPressed: any ColorToken
    public let mainVariantPressed: any ColorToken
    public let mainContainerPressed: any ColorToken
    public let supportPressed: any ColorToken
    public let supportVariantPressed: any ColorToken
    public let supportContainerPressed: any ColorToken
    public let accentPressed: any ColorToken
    public let accentVariantPressed: any ColorToken
    public let accentContainerPressed: any ColorToken
    public let surfacePressed: any ColorToken
    public let surfaceInversePressed: any ColorToken
    public let surfaceDarkPressed: any ColorToken
    public let successPressed: any ColorToken
    public let successContainerPressed: any ColorToken
    public let alertPressed: any ColorToken
    public let alertContainerPressed: any ColorToken
    public let errorPressed: any ColorToken
    public let errorContainerPressed: any ColorToken
    public let infoPressed: any ColorToken
    public let infoContainerPressed: any ColorToken
    public let neutralPressed: any ColorToken
    public let neutralContainerPressed: any ColorToken
    public let aiPressed: any ColorToken
    public let aiContainerPressed: any ColorToken
    public let focusPressed: any ColorToken
    public let focusContainerPressed: any ColorToken
    public let newPressed: any ColorToken
    public let newContainerPressed: any ColorToken
    public let businessPressed: any ColorToken
    public let businessContainerPressed: any ColorToken
    public let servicePressed: any ColorToken
    public let serviceContainerPressed: any ColorToken

    // MARK: - Init

    public init(
        mainPressed: any ColorToken,
        mainVariantPressed: any ColorToken,
        mainContainerPressed: any ColorToken,
        supportPressed: any ColorToken,
        supportVariantPressed: any ColorToken,
        supportContainerPressed: any ColorToken,
        accentPressed: any ColorToken,
        accentVariantPressed: any ColorToken,
        accentContainerPressed: any ColorToken,
        surfacePressed: any ColorToken,
        surfaceInversePressed: any ColorToken,
        surfaceDarkPressed: any ColorToken,
        successPressed: any ColorToken,
        successContainerPressed: any ColorToken,
        alertPressed: any ColorToken,
        alertContainerPressed: any ColorToken,
        errorPressed: any ColorToken,
        errorContainerPressed: any ColorToken,
        infoPressed: any ColorToken,
        infoContainerPressed: any ColorToken,
        neutralPressed: any ColorToken,
        neutralContainerPressed: any ColorToken,
        aiPressed: any ColorToken,
        aiContainerPressed: any ColorToken,
        focusPressed: any ColorToken,
        focusContainerPressed: any ColorToken,
        newPressed: any ColorToken,
        newContainerPressed: any ColorToken,
        businessPressed: any ColorToken,
        businessContainerPressed: any ColorToken,
        servicePressed: any ColorToken,
        serviceContainerPressed: any ColorToken
    ) {
        self.mainPressed = mainPressed
        self.mainVariantPressed = mainVariantPressed
        self.mainContainerPressed = mainContainerPressed
        self.supportPressed = supportPressed
        self.supportVariantPressed = supportVariantPressed
        self.supportContainerPressed = supportContainerPressed
        self.accentPressed = accentPressed
        self.accentVariantPressed = accentVariantPressed
        self.accentContainerPressed = accentContainerPressed
        self.surfacePressed = surfacePressed
        self.surfaceInversePressed = surfaceInversePressed
        self.surfaceDarkPressed = surfaceDarkPressed
        self.successPressed = successPressed
        self.successContainerPressed = successContainerPressed
        self.alertPressed = alertPressed
        self.alertContainerPressed = alertContainerPressed
        self.errorPressed = errorPressed
        self.errorContainerPressed = errorContainerPressed
        self.infoPressed = infoPressed
        self.infoContainerPressed = infoContainerPressed
        self.neutralPressed = neutralPressed
        self.neutralContainerPressed = neutralContainerPressed
        self.aiPressed = aiPressed
        self.aiContainerPressed = aiContainerPressed
        self.focusPressed = focusPressed
        self.focusContainerPressed = focusContainerPressed
        self.newPressed = newPressed
        self.newContainerPressed = newContainerPressed
        self.businessPressed = businessPressed
        self.businessContainerPressed = businessContainerPressed
        self.servicePressed = servicePressed
        self.serviceContainerPressed = serviceContainerPressed
    }
}
