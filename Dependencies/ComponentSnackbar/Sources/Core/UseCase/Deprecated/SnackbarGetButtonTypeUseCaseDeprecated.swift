//
//  SnackbarGetButtonTypeUseCaseDeprecated.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 03/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkComponentButton

// sourcery: AutoMockable
@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
protocol SnackbarGetButtonTypeUseCasableDeprecated {
    func execute(
        intent: SnackbarIntent,
        variant: SnackbarVariant
    ) -> SnackbarButtonTypeDeprecated
}

@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
final class SnackbarGetButtonTypeUseCaseDeprecated: SnackbarGetButtonTypeUseCasableDeprecated {
    func execute(
        intent: SnackbarIntent,
        variant: SnackbarVariant
    ) -> SnackbarButtonTypeDeprecated {
        switch intent {
        case .success:
            return self.getSuccessButtonType(variant: variant)
        case .alert:
            return self.getAlertButtonType(variant: variant)
        case .error:
            return self.getErrorButtonType(variant: variant)
        case .info:
            return self.getInfoButtonType(variant: variant)
        case .neutral:
            return self.getNeutralButtonType(variant: variant)
        case .main:
            return self.getMainButtonType(variant: variant)
        case .support:
            return self.getSupportButtonType(variant: variant)
        case .accent:
            return self.getAccentButtonType(variant: variant)
        case .surfaceInverse:
            return self.getSurfaceInverseButtonType(variant: variant)
        }
    }

    private func getSuccessButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .success,
            variant: .tinted
        )
    }

    private func getAlertButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .alert,
            variant: .tinted
        )
    }

    private func getErrorButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .danger,
            variant: .tinted
        )
    }

    private func getInfoButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .info,
            variant: .tinted
        )
    }

    private func getNeutralButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .neutral,
            variant: .tinted
        )
    }

    private func getMainButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .main,
            variant: .tinted
        )
    }

    private func getSupportButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .support,
            variant: .tinted
        )
    }

    private func getAccentButtonType(variant: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        return .init(
            intent: .accent,
            variant: .tinted
        )
    }

    private func getSurfaceInverseButtonType(variant _: SnackbarVariant) -> SnackbarButtonTypeDeprecated {
        // Note: variant has no impact on here
        return .init(
            intent: ButtonIntent.surface,
            variant: ButtonVariant.ghost
        )
    }
}
