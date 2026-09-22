//
//  ToastModifier.swift
//  SparkDemo
//
//  Created by robin.lemaire on 23/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ToastModifier: ViewModifier {

    // MARK: - Properties

    let text: String
    @Binding var isPresented: Bool
    let duration: TimeInterval

    private let showAnimation = Animation.spring(response: 0.35, dampingFraction: 0.85)
    private let hideAnimation = Animation.easeOut(duration: 2.0)

    // MARK: - View

    func body(content: Content) -> some View {
        ZStack {
            content

            if self.isPresented {
                ToastView(text: self.text)
            }
        }
        .animation(self.isPresented ? self.showAnimation : self.hideAnimation, value: self.isPresented)
        .onChange(of: self.isPresented) { value in
            guard value else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
                withAnimation {
                    self.isPresented = false
                }
            }
        }
    }
}

// MARK: - Extension

extension View {
    func toast(
        _ text: String,
        isPresented: Binding<Bool>,
        duration: TimeInterval = 2
    ) -> some View {
        self.modifier(ToastModifier(
            text: text,
            isPresented: isPresented,
            duration: duration
        ))
    }
}
