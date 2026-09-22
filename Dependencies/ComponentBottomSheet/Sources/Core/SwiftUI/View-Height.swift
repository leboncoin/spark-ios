//
//  View-Height.swift
//  SparkComponentBottomSheet
//
//  Created by Michael Zimmermann on 17.05.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

struct ViewHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

struct ViewHeightModifier: ViewModifier {
    let height: Binding<CGFloat>
    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: false, vertical: true)
            .background(
                GeometryReader{ geometry in
                    Color.clear
                        .preference(key: ViewHeightPreferenceKey.self, value: geometry.size.height)
                }
            )
            .onPreferenceChange(ViewHeightPreferenceKey.self) { viewHeight in
                if let viewHeight {
                    height.wrappedValue = viewHeight
                }
            }
    }
}

public extension View {
    /// A view modifier for reading the height of a view. The height will be set in the given binding.
    /// Sample:
    /// ```
    ///    Button("Show bottom sheet with longer text") {
    ///        self.showingMediumSheet.toggle()
    ///    }
    ///    .sheet(isPresented: $showingMediumSheet) {
    ///        BottomSheetPresentedView(description: mediumDescription) {
    ///            self.showingMediumSheet.toggle()
    ///        }
    ///        .readHeight(self.$mediumHeight)
    ///        .presentationDetents([.height(self.mediumHeight), .large])
    ///    }
    /// ```
    func readHeight(_ height: Binding<CGFloat>) -> some View {
        self
            .modifier(ViewHeightModifier(height: height))
    }
}
