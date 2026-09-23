//
//  View+IllustrationStyleExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 21/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func illustrationStyle() -> some View {
        ZStack {
            Image(.placeholder)
                .resizable()
                .aspectRatio(contentMode: .fit)

            self.frame(width: 50, height: 50)
        }
    }

}
