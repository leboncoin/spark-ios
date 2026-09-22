//
//  ColorSectionType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 13/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

enum ColorSectionType: CaseIterable {
    case accent
    case ai
    case base
    case business
    case feedback
    case focus
    case main
    case new
    case service
    case states
    case support

    // MARK: - Methods

    func viewModel(theme: any Theme) -> any ColorSectionViewModelable {
        let colors = theme.colors
        return switch self {
        case .accent: ColorSectionAccentViewModel(color: colors.accent)
        case .ai: ColorSectionAIViewModel(color: colors.ai)
        case .base: ColorSectionBaseViewModel(color: colors.base)
        case .business: ColorSectionBusinessViewModel(color: colors.business)
        case .feedback: ColorSectionFeedbackViewModel(color: colors.feedback)
        case .focus: ColorSectionFocusViewModel(color: colors.focus)
        case .main: ColorSectionMainViewModel(color: colors.main)
        case .new: ColorSectionNewViewModel(color: colors.new)
        case .service: ColorSectionServiceViewModel(color: colors.service)
        case .states: ColorSectionStatesViewModel(color: colors.states)
        case .support: ColorSectionSupportViewModel(color: colors.support)
        }
    }
}
