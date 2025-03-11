//
//  PopoverComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias PopoverComponentView = ComponentViewable<PopoverConfiguration, PopoverImplementationView, PopoverConfigurationView>

extension PopoverComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct PopoverImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<PopoverConfiguration>

    @State private var isPresented: Bool = false

    // MARK: - View

    var body: some View {
        if #available(iOS 16.4, *) {
            Button(action: {
                self.isPresented = true
            }, label: {
                Text("Show popover")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .popover(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                isPresented: self.$isPresented
            ) { colors in
                Text(self.configurationWrapped.text)
                    .foregroundStyle(colors.foreground.color)
                    .frame(width: 300)
            }
        } else {
            Text("Popover is available since iOS 16.4")
        }
    }
}

// MARK: - Preview

struct PopoverComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverComponentView()
    }
}
