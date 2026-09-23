//
//  TabBackgroundLineDeprecated.swift
//  SparkComponentTab
//
//  Created by Michael Zimmermann on 17.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

struct TabBackgroundLineDeprecated: View {
    let lineHeight: CGFloat
    let width: CGFloat
    let color: Color

    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: self.lineHeight)
            .frame(width: self.width)
            .foregroundColor(self.color)

    }
}
