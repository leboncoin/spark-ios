//
//  SwitchViewModelDependencies.swift
//  SparkComponentSwitch
//
//  Created by robin.lemaire on 03/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

// sourcery: AutoMockable
protocol SwitchViewModelDependenciesProtocol {
    var getColorsUseCase: any SwitchGetColorsUseCaseable { get }
    var getImagesStateUseCase: any SwitchGetImagesStateUseCaseable { get }
    var getToggleColorUseCase: any SwitchGetToggleColorUseCaseable { get }
    var getPositionUseCase: any SwitchGetPositionUseCaseable { get }
    var getToggleStateUseCase: any SwitchGetToggleStateUseCaseable { get }

    func makeDisplayedTextViewModel(text: String?,
                                    attributedText: AttributedStringEither?) -> DisplayedTextViewModel
}

struct SwitchViewModelDependencies: SwitchViewModelDependenciesProtocol {

    // MARK: - Properties

    let getColorsUseCase: any SwitchGetColorsUseCaseable
    var getImagesStateUseCase: any SwitchGetImagesStateUseCaseable
    let getToggleColorUseCase: any SwitchGetToggleColorUseCaseable
    let getPositionUseCase: any SwitchGetPositionUseCaseable
    let getToggleStateUseCase: any SwitchGetToggleStateUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any SwitchGetColorsUseCaseable = SwitchGetColorsUseCase(),
        getImagesStateUseCase: any SwitchGetImagesStateUseCaseable = SwitchGetImagesStateUseCase(),
        getToggleColorUseCase: any SwitchGetToggleColorUseCaseable = SwitchGetToggleColorUseCase(),
        getPositionUseCase: any SwitchGetPositionUseCaseable = SwitchGetPositionUseCase(),
        getToggleStateUseCase: any SwitchGetToggleStateUseCaseable = SwitchGetToggleStateUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getImagesStateUseCase = getImagesStateUseCase
        self.getToggleColorUseCase = getToggleColorUseCase
        self.getPositionUseCase = getPositionUseCase
        self.getToggleStateUseCase = getToggleStateUseCase
    }

    // MARK: - Maker

    func makeDisplayedTextViewModel(
        text: String?,
        attributedText: AttributedStringEither?
    ) -> DisplayedTextViewModel {
        return DisplayedTextViewModelDefault(
            text: text,
            attributedText: attributedText
        )
    }
}
