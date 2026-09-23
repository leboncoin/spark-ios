//
//  CardComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CardComponentView = ComponentViewable<CardConfiguration, CardImplementationView, CardConfigurationView, CardExtraTools>

// MARK: - Subview

struct CardImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CardConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkCardIntent(self.configurationWrapped.intent)
            .sparkCardIsHighlighted(self.configurationWrapped.isHighlighted)
            .sparkCardPadding(self.configurationWrapped.swiftUIPadding)
            .sparkCardVariant(self.configurationWrapped.variant)
            .sparkCardHeaderPosition(self.configurationWrapped.swiftUIHeaderPosition)
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoAccessibilityHidden(self.configurationWrapped)
            .padding(.top, self.configurationWrapped.swiftUIHeaderPosition == .border ? 20 : 0)
            .demoBackground(self.configurationWrapped)
            .alert("Pressed", isPresented: self.$showAlertAction) {
                Button("OK", role: .cancel) {
                }
            }
    }

    @ViewBuilder
    private func component() -> some View {
        // With header
        if let header = self.configurationWrapped.swiftUIHeader.nilIfEmpty {

            if self.configurationWrapped.swiftUIHeaderIsCustomContent {
                SparkCard(
                    header: self.header,
                    content: self.content,
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil
                )
            } else {
                SparkCard(
                    header: header,
                    content: self.content,
                    action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil
                )
            }

        } else { // Without header
            SparkCard(
                content: self.content,
                action: self.configurationWrapped.swiftUIWithAction ? { self.showAlertAction = true} : nil
            )
        }
    }

    @ViewBuilder
    private func header() -> some View {
        VStack {
            Text(self.configurationWrapped.swiftUIHeader)
            Text(self.configurationWrapped.swiftUIHeaderSecondText)
                .bold()
        }
    }

    @ViewBuilder
    private func content() -> some View {
        VStack(alignment: .leading, spacing: .medium) {
            TagImplementationView(configuration: self.configuration.tag)

            VStack(alignment: .leading, spacing: .small) {
                HStack {
                    IconImplementationView(configuration: self.configuration.icon)

                    Text("Welcome on Card")
                }

                Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
                    .multilineTextAlignment(.leading)
                    .truncationMode(.middle)
            }

            ButtonImplementationView(configuration: self.configuration.button)
        }
    }
}
