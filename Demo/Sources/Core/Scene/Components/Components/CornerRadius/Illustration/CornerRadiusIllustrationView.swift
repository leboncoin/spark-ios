//
//  CornerRadiusIllustrationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CornerRadiusIllustrationView: View {

    // MARK: - View

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.level1)
            .illustrationStyle()
    }
}

#Preview {
    CornerRadiusIllustrationView()
}
