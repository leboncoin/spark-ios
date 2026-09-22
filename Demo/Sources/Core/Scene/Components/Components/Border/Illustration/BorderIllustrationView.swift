//
//  BorderIllustrationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct BorderIllustrationView: View {

    // MARK: - View

    var body: some View {
        Rectangle()
            .stroke(Color.level1, lineWidth: 2)
            .illustrationStyle()
    }
}

#Preview {
    BorderIllustrationView()
}
