//
//  RatingInputComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RatingInputComponentView = ComponentViewable<RatingInputConfiguration, RatingInputImplementationView, RatingInputConfigurationView>

extension RatingInputComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RatingInputImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RatingInputConfiguration>
    @State private var rating: CGFloat = CGFloat(Int.random(in: 0...5))

    // MARK: - View

    var body: some View {
        VStack {
            RatingInputView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                rating: self.$rating
            )
            .demoAccessibilityLabel(self.configurationWrapped)

            Text(self.configurationWrapped.getInfoValue(from: self.rating))
                .demoComponentInfoBackground()
        }
    }
}

// MARK: - Preview

struct RatingInputComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RatingInputComponentView()
    }
}
