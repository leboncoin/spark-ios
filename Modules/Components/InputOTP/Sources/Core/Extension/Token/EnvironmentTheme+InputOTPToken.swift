//
//  EnvironmentTheme+InputOTPToken.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkCommon

extension EnvironmentTheme {

    // MARK: - Private Properties

    private var token: InputOTPToken {
        self.value.component.inputOTP
    }

    // MARK: - Properties

    var border: InputOTPToken.Border {
        self.token.border
    }

    var colors: InputOTPToken.Colors {
        self.token.colors
    }

    var layout: InputOTPToken.Layout {
        self.token.layout
    }

    var opacity: InputOTPToken.Opacity {
        self.token.opacity
    }

    var typography: InputOTPToken.Typography {
        self.token.typography
    }

    var size: InputOTPToken.Size {
        self.token.size
    }
}
