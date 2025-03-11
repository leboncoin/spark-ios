//
//  BottomSheetComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BottomSheetComponentView = ComponentViewable<BottomSheetConfiguration, BottomSheetImplementationView, BottomSheetConfigurationView>

extension BottomSheetComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct BottomSheetImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BottomSheetConfiguration>

    @State private var isPresented: Bool = false
    @State private var height: CGFloat = 100

    // MARK: - View

    var body: some View {
        VStack {
            Button(action: {
                self.isPresented = true
            }, label: {
                Text("Show bottom sheet")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: self.$isPresented) {
                if self.configurationWrapped.contentType.isScrollView {
                    ScrollView {
                        self.presentedView()
                    }
                    .scrollIndicators(.visible)
                    .presentationDetents([.medium, .maxHeight])
                } else {
                    self.presentedView()
                        .readHeight(self.$height)
                        .presentationDetents([.height(self.height), self.configurationWrapped.contentType.otherDetent])
                }
            }

            Text(self.configurationWrapped.contentType.description)
                .demoComponentInfoBackground()
        }
    }

    private func presentedView() -> some View {
        VStack(spacing: .xLarge) {
            VStack(spacing: .medium) {
                Text("Bottom Sheet")
                    .font(.title)

                Text(self.configurationWrapped.contentType.description)
                    .font(.title3)
            }

            Text(self.configurationWrapped.contentType.text)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Button {
                self.isPresented = false
            } label: {
                Text("Dismiss")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, .large)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview

struct BottomSheetComponentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetComponentView()
    }
}
