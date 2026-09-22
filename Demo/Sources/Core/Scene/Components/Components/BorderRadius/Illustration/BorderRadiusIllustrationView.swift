//
//  BorderRadiusIllustrationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct BorderRadiusIllustrationView: View {

    // MARK: - View

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.level1, lineWidth: 2)
            .illustrationStyle()
    }
}

#Preview {
    BorderRadiusIllustrationView()
}
