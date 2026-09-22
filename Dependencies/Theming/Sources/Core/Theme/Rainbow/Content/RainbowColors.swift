//
//  RainbowColors.swift
//  SparkTheming
//
//  Created by robin.lemaire on 14/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

struct RainbowColors: Colors {

    // MARK: - Properties

    let main: any ColorsMain = ColorsMainDefault(
        main: RainbowColorToken(color: .purple),
        onMain: RainbowColorToken(color: .blue),
        mainVariant: RainbowColorToken(color: .green),
        onMainVariant: RainbowColorToken(color: .yellow),
        mainContainer: RainbowColorToken(color: .orange),
        onMainContainer: RainbowColorToken(color: .red)
    )

    let support: any ColorsSupport = ColorsSupportDefault(
        support: RainbowColorToken(color: .red),
        onSupport: RainbowColorToken(color: .orange),
        supportVariant: RainbowColorToken(color: .yellow),
        onSupportVariant: RainbowColorToken(color: .green),
        supportContainer: RainbowColorToken(color: .blue),
        onSupportContainer: RainbowColorToken(color: .purple)
    )

    let accent: any ColorsAccent = ColorsAccentDefault(
        accent: RainbowColorToken(color: .purple),
        onAccent: RainbowColorToken(color: .blue),
        accentVariant: RainbowColorToken(color: .green),
        onAccentVariant: RainbowColorToken(color: .yellow),
        accentContainer: RainbowColorToken(color: .orange),
        onAccentContainer: RainbowColorToken(color: .red)
    )

    let base: any ColorsBase = ColorsBaseDefault(
        background: RainbowColorToken(color: .purple),
        onBackground: RainbowColorToken(color: .blue),
        backgroundVariant: RainbowColorToken(color: .green),
        onBackgroundVariant: RainbowColorToken(color: .yellow),
        surface: RainbowColorToken(color: .orange),
        onSurface: RainbowColorToken(color: .red),
        surfaceInverse: RainbowColorToken(color: .orange),
        onSurfaceInverse: RainbowColorToken(color: .yellow),
        surfaceDark: RainbowColorToken(color: .gray),
        onSurfaceDark: RainbowColorToken(color: .white),
        outline: RainbowColorToken(color: .green),
        outlineHigh: RainbowColorToken(color: .blue),
        overlay: RainbowColorToken(color: .purple),
        onOverlay: RainbowColorToken(color: .blue)
    )

    let feedback: any ColorsFeedback = ColorsFeedbackDefault(
        success: RainbowColorToken(color: .red),
        onSuccess: RainbowColorToken(color: .orange),
        successContainer: RainbowColorToken(color: .yellow),
        onSuccessContainer: RainbowColorToken(color: .green),
        alert: RainbowColorToken(color: .blue),
        onAlert: RainbowColorToken(color: .purple),
        alertContainer: RainbowColorToken(color: .blue),
        onAlertContainer: RainbowColorToken(color: .green),
        error: RainbowColorToken(color: .yellow),
        onError: RainbowColorToken(color: .orange),
        errorContainer: RainbowColorToken(color: .red),
        onErrorContainer: RainbowColorToken(color: .orange),
        info: RainbowColorToken(color: .yellow),
        onInfo: RainbowColorToken(color: .green),
        infoContainer: RainbowColorToken(color: .blue),
        onInfoContainer: RainbowColorToken(color: .purple),
        neutral: RainbowColorToken(color: .blue),
        onNeutral: RainbowColorToken(color: .green),
        neutralContainer: RainbowColorToken(color: .yellow),
        onNeutralContainer: RainbowColorToken(color: .orange)
    )

    let states: any ColorsStates = ColorsStatesDefault(
        mainPressed: RainbowColorToken(color: .purple),
        mainVariantPressed: RainbowColorToken(color: .blue),
        mainContainerPressed: RainbowColorToken(color: .green),
        supportPressed: RainbowColorToken(color: .yellow),
        supportVariantPressed: RainbowColorToken(color: .orange),
        supportContainerPressed: RainbowColorToken(color: .red),
        accentPressed: RainbowColorToken(color: .orange),
        accentVariantPressed: RainbowColorToken(color: .yellow),
        accentContainerPressed: RainbowColorToken(color: .green),
        surfacePressed: RainbowColorToken(color: .blue),
        surfaceInversePressed: RainbowColorToken(color: .green),
        surfaceDarkPressed: RainbowColorToken(color: .darkGray),
        successPressed: RainbowColorToken(color: .yellow),
        successContainerPressed: RainbowColorToken(color: .orange),
        alertPressed: RainbowColorToken(color: .red),
        alertContainerPressed: RainbowColorToken(color: .orange),
        errorPressed: RainbowColorToken(color: .yellow),
        errorContainerPressed: RainbowColorToken(color: .green),
        infoPressed: RainbowColorToken(color: .blue),
        infoContainerPressed: RainbowColorToken(color: .purple),
        neutralPressed: RainbowColorToken(color: .blue),
        neutralContainerPressed: RainbowColorToken(color: .green),
        aiPressed: RainbowColorToken(color: .yellow),
        aiContainerPressed: RainbowColorToken(color: .orange),
        focusPressed: RainbowColorToken(color: .red),
        focusContainerPressed: RainbowColorToken(color: .purple),
        newPressed: RainbowColorToken(color: .blue),
        newContainerPressed: RainbowColorToken(color: .green),
        businessPressed: RainbowColorToken(color: .yellow),
        businessContainerPressed: RainbowColorToken(color: .orange),
        servicePressed: RainbowColorToken(color: .red),
        serviceContainerPressed: RainbowColorToken(color: .purple)
    )

    let ai: any ColorsAI = ColorsAIDefault(
        ai: RainbowColorToken(color: .yellow),
        onAI: RainbowColorToken(color: .green),
        aiContainer: RainbowColorToken(color: .blue),
        onAIContainer: RainbowColorToken(color: .purple)
    )

    let focus: any ColorsFocus = ColorsFocusDefault(
        focus: RainbowColorToken(color: .red),
        onFocus: RainbowColorToken(color: .orange),
        focusContainer: RainbowColorToken(color: .yellow),
        onFocusContainer: RainbowColorToken(color: .green)
    )

    let new: any ColorsNew = ColorsNewDefault(
        new: RainbowColorToken(color: .blue),
        onNew: RainbowColorToken(color: .purple),
        newContainer: RainbowColorToken(color: .purple),
        onNewContainer: RainbowColorToken(color: .blue)
    )

    let business: any ColorsBusiness = ColorsBusinessDefault(
        business: RainbowColorToken(color: .green),
        onBusiness: RainbowColorToken(color: .yellow),
        businessContainer: RainbowColorToken(color: .orange),
        onBusinessContainer: RainbowColorToken(color: .red)
    )

    let service: any ColorsService = ColorsServiceDefault(
        service: RainbowColorToken(color: .orange),
        onService: RainbowColorToken(color: .red),
        serviceContainer: RainbowColorToken(color: .red),
        onServiceContainer: RainbowColorToken(color: .orange)
    )

    // MARK: - Initialization

    init() {}
}

// MARK: - Private Token

private struct RainbowColorToken: ColorToken {

    // MARK: - Properties

    var uiColor: UIColor
    var color: Color

    // MARK: - Initialization

    init(color: UIColor) {
        self.uiColor = color
        self.color = .init(uiColor: color)
    }
}
