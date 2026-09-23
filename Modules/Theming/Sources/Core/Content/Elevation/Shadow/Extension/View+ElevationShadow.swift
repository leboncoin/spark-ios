//
//  View+ElevationShadow.swift
//  SparkTheming
//
//  Created by louis.borlee on 30/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {
    func shadow(_ shadow: any ElevationShadow) -> some View {
        return self.shadow(
            color: shadow.colorToken.color.opacity(Double(shadow.opacity)),
            radius: shadow.blur,
            x: shadow.offset.x,
            y: shadow.offset.y
        )
    }
}
