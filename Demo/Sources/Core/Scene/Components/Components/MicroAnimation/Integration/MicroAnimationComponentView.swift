//
//  MicroAnimationComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias MicroAnimationComponentView = ComponentViewable<MicroAnimationConfiguration, MicroAnimationImplementationView, MicroAnimationConfigurationView, MicroAnimationExtraTools>

extension MicroAnimationComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct MicroAnimationImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<MicroAnimationConfiguration>
    @State private var isPlayed: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            switch self.configurationWrapped.type {
            case .bell: self.bellContentView()
            }

            // Info
            HStack( spacing: .medium) {
                Text(self.configurationWrapped.type.name)

                Divider()
                    .infoFrame()

                Text(self.configurationWrapped.getInfo())
                    .italic()

                Divider()
                    .infoFrame()

                Button("Start") {
                    self.isPlayed.toggle()
                }
                .bold()
                .foregroundStyle(Color.accentColor)
                .disabled(self.isPlayed)
                .buttonStyle(.plain)
            }
            .demoComponentInfoBackground()
        }
    }

    @ViewBuilder
    private func bellContentView() -> some View {
        let bellConfiguration = self.configuration.bellConfiguration
        HStack(alignment: .center, spacing: 20) {
            IconImplementationView(
                configuration: bellConfiguration.iconConfiguration
            )
            .animate(
                type: .bell,
                play: self.isPlayed,
                repeat: self.configurationWrapped.getRepeat()) {
                    self.isPlayed = false
                }

            ButtonImplementationView(
                configuration: bellConfiguration.iconButtonConfiguration
            )
            .animate(
                type: .bell,
                play: self.isPlayed,
                repeat: self.configurationWrapped.getRepeat()) {
                    self.isPlayed = false
                }

            Spacer()
        }
    }
}
