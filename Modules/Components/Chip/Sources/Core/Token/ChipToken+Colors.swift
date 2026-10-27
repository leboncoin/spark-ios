//
//  ChipToken+Colors.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Colors

public extension ChipToken {

    /// Contains the color token values of the Chip.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The background color of the chip.
        public func background(
            intent: ChipIntent,
            variant: ChipVariant,
            isSelected: Bool,
            isPressed: Bool
        ) -> any ColorToken {
            return switch (variant, isSelected, isPressed) {
            case (.dashed, _, true), (.outlined, _, true):
                self.mainColor(intent: intent).opacity(self.theme.dims.dim5)
            case (.dashed, true, false), (.outlined, true, false):
                self.containerColor(intent: intent)
            case (.dashed, false, false), (.outlined, false, false):
                ColorTokenDefault.clear
            case (.tinted, _, true):
                self.containerPressedColor(intent: intent)
            case (.tinted, true, false):
                self.tintedSelectedColor(intent: intent)
            case (.tinted, false, false):
                self.tintedBackgroundColor(intent: intent)
            }
        }

        /// The border color of the chip.
        public func border(
            intent: ChipIntent,
            variant: ChipVariant,
            isSelected: Bool,
            isPressed: Bool
        ) -> any ColorToken {
            return switch (variant, isSelected, isPressed) {
            case (.dashed, _, _), (.outlined, _, _):
                self.mainColor(intent: intent)
            case (.tinted, _, true):
                self.containerPressedColor(intent: intent)
            case (.tinted, true, false):
                self.tintedSelectedColor(intent: intent)
            case (.tinted, false, false):
                intent == .surface ? ColorTokenDefault.clear : self.containerColor(intent: intent)
            }
        }

        /// The content (title and icon) color of the chip.
        public func content(
            intent: ChipIntent,
            variant: ChipVariant,
            isSelected: Bool,
            isPressed: Bool
        ) -> any ColorToken {
            return switch (variant, isSelected, isPressed) {
            case (.dashed, _, _), (.outlined, _, _):
                self.mainColor(intent: intent)
            case (.tinted, true, false):
                self.onMainColor(intent: intent)
            case (.tinted, _, _):
                self.onContainerColor(intent: intent)
            }
        }

        // MARK: - Private Methods

        private func tintedBackgroundColor(intent: ChipIntent) -> any ColorToken {
            return if intent == .surface {
                self.theme.colors.base.surface.opacity(self.theme.dims.dim1)
            } else {
                self.containerColor(intent: intent)
            }
        }

        private func tintedSelectedColor(intent: ChipIntent) -> any ColorToken {
            return intent == .surface ? self.theme.colors.base.surface : self.mainColor(intent: intent)
        }

        private func mainColor(intent: ChipIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .accent: colors.accent.accent
            case .alert: colors.feedback.alert
            case .danger: colors.feedback.error
            case .info: colors.feedback.info
            case .main: colors.main.main
            case .neutral: colors.feedback.neutral
            case .success: colors.feedback.success
            case .support: colors.support.support
            case .surface: colors.base.onSurface
            }
        }

        private func onMainColor(intent: ChipIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .accent: colors.accent.onAccent
            case .alert: colors.feedback.onAlert
            case .danger: colors.feedback.onError
            case .info: colors.feedback.onInfo
            case .main: colors.main.onMain
            case .neutral: colors.feedback.onNeutral
            case .success: colors.feedback.onSuccess
            case .support: colors.support.onSupport
            case .surface: colors.base.onSurface
            }
        }

        private func containerColor(intent: ChipIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .accent: colors.accent.accentContainer
            case .alert: colors.feedback.alertContainer
            case .danger: colors.feedback.errorContainer
            case .info: colors.feedback.infoContainer
            case .main: colors.main.mainContainer
            case .neutral: colors.feedback.neutralContainer
            case .success: colors.feedback.successContainer
            case .support: colors.support.supportContainer
            case .surface: colors.base.surface
            }
        }

        private func onContainerColor(intent: ChipIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .accent: colors.accent.onAccentContainer
            case .alert: colors.feedback.onAlertContainer
            case .danger: colors.feedback.onErrorContainer
            case .info: colors.feedback.onInfoContainer
            case .main: colors.main.onMainContainer
            case .neutral: colors.feedback.onNeutralContainer
            case .success: colors.feedback.onSuccessContainer
            case .support: colors.support.onSupportContainer
            case .surface: colors.base.surfaceInverse
            }
        }

        private func containerPressedColor(intent: ChipIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .accent: colors.states.accentContainerPressed
            case .alert: colors.states.alertContainerPressed
            case .danger: colors.states.errorContainerPressed
            case .info: colors.states.infoContainerPressed
            case .main: colors.states.mainContainerPressed
            case .neutral: colors.states.neutralContainerPressed
            case .success: colors.states.successContainerPressed
            case .support: colors.states.supportContainerPressed
            case .surface: colors.states.surfacePressed
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
