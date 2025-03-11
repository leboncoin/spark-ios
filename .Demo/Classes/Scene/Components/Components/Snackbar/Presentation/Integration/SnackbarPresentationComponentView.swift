//
//  SnackbarPresentationComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: To fix :
// not working when .snackbar is on child view

// MARK: - View

typealias SnackbarPresentationComponentView = ComponentViewable<SnackbarPresentationConfiguration, SnackbarPresentationImplementationView, SnackbarPresentationConfigurationView>

extension SnackbarPresentationComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct SnackbarPresentationImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SnackbarPresentationConfiguration>

    @State private var isPresented: Bool = false

    // MARK: - View

    var body: some View {
        Button(action: {
            self.isPresented = true
        }, label: {
            Text("Show snackbar")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .snackbar(
            isPresented: self.$isPresented,
            direction: self.configurationWrapped.direction,
            autoDismissDelay: self.configurationWrapped.autoDismissDelay,
            snackbar: {
                SnackbarView(
                    theme: DemoThemes.shared.mainTheme.value,
                    intent: .basic,
                    image: .init(icon: .infoOutline)) {
                        Text("This is a snackbar")
                    } button: { buttonView in
                        buttonView
                            .title("Dismiss", for: .normal)
                    } action: {
                        self.isPresented = false
                    }
                    .frame(maxWidth: 600)
                    .padding(
                        .init(
                            top: self.configurationWrapped.topInsetString.cgFloat ?? 0,
                            leading: self.configurationWrapped.leftInsetString.cgFloat ?? 0,
                            bottom: self.configurationWrapped.bottomInsetString.cgFloat ?? 0,
                            trailing: self.configurationWrapped.rightInsetString.cgFloat ?? 0
                        )
                    )
            }
        )
    }
}

// MARK: - Preview

struct SnackbarPresentationComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SnackbarPresentationComponentView()
    }
}
