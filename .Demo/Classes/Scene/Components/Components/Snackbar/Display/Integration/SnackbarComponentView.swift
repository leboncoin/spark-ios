//
//  SnackbarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SnackbarComponentView = ComponentViewable<SnackbarConfiguration, SnackbarImplementationView, SnackbarConfigurationView>

extension SnackbarComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SnackbarImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SnackbarConfiguration>

    @State private var isShowingAlert: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            switch self.configurationWrapped.contentType {
            case .empty:
                self.emptySnackbar()
            case .button:
                self.snackbarWithButton()
            case .custom:
                self.snackbarWithCustomView()
            }
        }
        .lineLimit(self.configurationWrapped.maxNumberOfLines)
        .demoAccessibilityLabel(self.configurationWrapped)
        .alert(isPresented: self.$isShowingAlert) {
            Alert(
                title: Text("Button has been pressed"),
                message: nil,
                dismissButton: Alert.Button.cancel()
            )
        }
    }

    @ViewBuilder private func emptySnackbar() -> SnackbarView<EmptyView> {
        SnackbarView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            image: Image(icon: self.configurationWrapped.icon)) {
                Text(self.configurationWrapped.text)
            }
            .variant(self.configurationWrapped.variant)
            .type(self.configurationWrapped.type)
    }

    @ViewBuilder private func snackbarWithButton() -> SnackbarView<ButtonView> {
        SnackbarView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            image: Image(icon: self.configurationWrapped.icon)) {
                Text(self.configurationWrapped.text)
            } button: { configuration in
                ButtonView(
                    theme: self.configurationWrapped.theme.value,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    size: configuration.size,
                    shape: configuration.shape,
                    alignment: .leadingImage) {
                        self.isShowingAlert = true
                    }
                    .title(self.configurationWrapped.buttonTitle, for: .normal)
            }
            .variant(self.configurationWrapped.variant)
            .type(self.configurationWrapped.type)
    }

    @ViewBuilder private func snackbarWithCustomView() -> SnackbarView<some View> {
        SnackbarView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            image: Image(icon: self.configurationWrapped.icon)) {
                Text(self.configurationWrapped.text)
            } button: { configuration in
                HStack {
                    IconButtonView(
                        theme: self.configurationWrapped.theme.value,
                        intent: .danger,
                        variant: .filled,
                        size: .large,
                        shape: .pill,
                        action: {
                            self.isShowingAlert = true
                        }
                    )
                    .image(.init(icon: .warningFill), for: .normal)

                    IconButtonView(
                        theme: self.configurationWrapped.theme.value,
                        intent: .success,
                        variant: .contrast,
                        size: .small,
                        shape: .square,
                        action: {
                            self.isShowingAlert = true
                        }
                    )
                    .image(.init(icon: .infoOutline), for: .normal)
                }
            }
            .variant(self.configurationWrapped.variant)
            .type(self.configurationWrapped.type)
    }
}

// MARK: - Preview

struct SnackbarComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SnackbarComponentView()
    }
}
