//
//  ToastView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 23/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ToastView: View {
    let text: String

    var body: some View {
        Text(self.text)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.bottom, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .transition(
                .move(edge: .bottom)
                .combined(with: .opacity)
                .combined(with: .scale(scale: 0.98, anchor: .bottom))
            )
    }
}
