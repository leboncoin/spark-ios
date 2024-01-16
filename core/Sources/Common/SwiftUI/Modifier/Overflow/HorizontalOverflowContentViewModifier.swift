//
//  HorizontalOverflowContentViewModifier.swift
//  SparkCore
//
//  Created by michael.zimmermann on 05.09.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import SwiftUI

/// Wraps the content in a horizontal scroll view, if the content is too wide to display on screen.
struct HorizontalOverflowContentViewModifier<Value>: ViewModifier where Value: Equatable {
    // MARK: - Properties
    @State private var contentOverflow: Bool = false
    @State private var height: CGFloat = 0
    @Binding var value: Value

    // MARK: - View
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .overlay(
                    GeometryReader { contentGeometry in
                        Color.clear
                            .onAppear {
                                self.height = contentGeometry.size.height
                                contentOverflow = contentGeometry.size.width > geometry.size.width
                                print("HEIGHT \(self.height) / \(geometry.size.height)")
                            }
                            .onChange(of: self.value) { _ in
                                self.height = contentGeometry.size.height
                                contentOverflow = contentGeometry.size.width > geometry.size.width
                            }
                            .onChange(of: geometry.size) { newSize in
                                print("GEO CHANGE w \(geometry.size.width.des) \(newSize.width.des)")
                                print("GEO CHANGE h \(geometry.size.height.des) \(newSize.height.des)")

                                contentOverflow = contentGeometry.size.width > geometry.size.width
                                self.height = newSize.height
                            }
                    }
                )
                .wrappedInScrollView(when: contentOverflow)
//                .frame(height: self.height)
        }
//        .frame(height: self.height)
    }
}

extension View {
    @ViewBuilder
    func wrappedInScrollView(when condition: Bool) -> some View {
        ScrollView(condition ? .horizontal : [],
                   showsIndicators: false) {
            self
        }
//        if condition {
//            ScrollView(.horizontal, showsIndicators: false) {
//                self
//            }
//        } else {
//            self
//        }
    }

    func scrollOnOverflow<Value>(value: Binding<Value>) -> some View where Value: Equatable {
        modifier(HorizontalOverflowContentViewModifier<Value>(value: value))
    }
}
