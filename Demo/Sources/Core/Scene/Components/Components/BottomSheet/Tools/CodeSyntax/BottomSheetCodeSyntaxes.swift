//
//  BottomSheetCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BottomSheetCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple with Medium Detent", code: Self.simpleWithMediumDetent),
            .init(title: "Multiple Detents", code: Self.multipleDetents),
            .init(title: "With ScrollView", code: Self.withScrollView),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleWithMediumDetent: String {
        """
        import SwiftUI

        struct ContentView: View {
            @State private var isPresented = false

            var body: some View {
                Button("Show Bottom Sheet") {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    VStack(spacing: 16) {
                        Text("Bottom Sheet")
                            .font(.title)

                        Text("This is a simple bottom sheet example.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()

                        Button("Dismiss") {
                            isPresented = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.top, 24)
                    .presentationDetents([.medium])
                }
            }
        }
        """
    }

    private static var multipleDetents: String {
        """
        import SwiftUI

        struct ContentView: View {
            @State private var isPresented = false

            var body: some View {
                Button("Show Bottom Sheet") {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    VStack(spacing: 16) {
                        Text("Bottom Sheet")
                            .font(.title)

                        Text("This sheet supports multiple detents.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()

                        Button("Dismiss") {
                            isPresented = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.top, 24)
                    .presentationDetents([.medium, .large])
                }
            }
        }
        """
    }

    private static var withScrollView: String {
        """
        import SwiftUI

        struct ContentView: View {
            @State private var isPresented = false

            var body: some View {
                Button("Show Bottom Sheet") {
                    isPresented = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isPresented) {
                    ScrollView {
                        VStack(spacing: 24) {
                            VStack(spacing: 16) {
                                Text("Bottom Sheet")
                                    .font(.title)

                                Text("With ScrollView")
                                    .font(.title3)
                            }

                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()

                            Button("Dismiss") {
                                isPresented = false
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding(.top, 24)
                    }
                    .scrollIndicators(.visible)
                    .presentationDetents([.medium, .large])
                }
            }
        }
        """
    }

    private static var fullConfiguration: String {
        """
        import SwiftUI

        struct ContentView: View {
            @State private var isPresented = false
            @State private var selectedDetent: PresentationDetent = .medium

            var body: some View {
                Button("Show Bottom Sheet") {
                    isPresented = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isPresented) {
                    ScrollView {
                        VStack(spacing: 24) {
                            Text("Bottom Sheet")
                                .font(.title)

                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()

                            Button("Dismiss") {
                                isPresented = false
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding(.top, 24)
                        .frame(maxWidth: .infinity)
                    }
                    .scrollIndicators(.visible)
                    .presentationDetents([.medium, .large], selection: $selectedDetent)
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
                    .presentationBackgroundInteraction(.enabled)
                    .interactiveDismissDisabled(false)
                }
            }
        }
        """
    }
}
