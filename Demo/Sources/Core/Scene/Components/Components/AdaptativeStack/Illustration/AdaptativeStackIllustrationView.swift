//
//  AdaptativeStackIllustrationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct AdaptativeStackIllustrationView: View {

    // MARK: - View

    var body: some View {
        VStack {
            ForEach(0..<2) { _ in
                HStack {
                    ForEach(0..<2) { _ in
                        self.content()
                    }
                }
            }
        }
        .illustrationStyle()
    }

    // MARK: - View Builder

    private func content() -> some View {
        RoundedRectangle(cornerRadius: 4)
            .stroke(Color.level1, lineWidth: 2)
    }
}

#Preview {
    AdaptativeStackIllustrationView()
}
