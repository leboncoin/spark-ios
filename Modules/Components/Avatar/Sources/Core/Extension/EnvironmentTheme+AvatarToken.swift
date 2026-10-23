//
//  EnvironmentTheme+AvatarToken.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: AvatarToken {
        self.value.component.avatar
    }

    // MARK: - Properties

    var border: AvatarToken.Border {
        self.token.border
    }

    var colors: AvatarToken.Colors {
        self.token.colors
    }

    var layout: AvatarToken.Layout {
        self.token.layout
    }

    var typography: AvatarToken.Typography {
        self.token.typography
    }

    var dims: AvatarToken.Dims {
        self.token.dims
    }

    var size: AvatarToken.Size {
        self.token.size
    }

    var scaleEffect: AvatarToken.ScaleEffect {
        self.token.scaleEffect
    }

    var cornerViewOffset: AvatarToken.CornerViewOffset {
        self.token.cornerViewOffset
    }
}
