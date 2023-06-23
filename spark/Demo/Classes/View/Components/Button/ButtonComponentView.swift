//
//  ButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 26/05/2023.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import SwiftUI
import Spark
import SparkCore

struct ButtonComponentView: View {

    // MARK: - Properties

    let viewModel = ButtonComponentViewModel()

    @State private var uiKitViewHeight: CGFloat = .zero

    @State private var versionSheetIsPresented = false
    @State var version: ComponentVersion = .uiKit

    @State private var intentColorSheetIsPresented = false
    @State var intentColor: ButtonIntentColor = .primary

    @State private var variantSheetIsPresented = false
    @State var variant: ButtonVariant = .filled

    @State private var sizeSheetIsPresented = false
    @State var size: ButtonSize = .medium

    @State private var shapeSheetIsPresented = false
    @State var shape: ButtonShape = .rounded

    @State private var iconSheetIsPresented = false
    @State var icon: ButtonIcon = .none

    @State private var isEnabledSheetIsPresented = false
    @State var isEnabled: Bool = true

    @State private var isTextSheetIsPresented = false
    @State var isText: Bool = true

    // MARK: - View

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Configuration")
                    .font(.title2)
                    .bold()

                VStack(alignment: .leading, spacing: 16) {
                    // **
                    // Version
                    HStack() {
                        Text("Version: ")
                            .bold()
                        Button("\(self.version.name)") {
                            self.versionSheetIsPresented = true
                        }
                        .confirmationDialog("Select an version", isPresented: self.$versionSheetIsPresented) {
                            ForEach(ComponentVersion.allCases, id: \.self) { version in
                                Button("\(version.name)") {
                                    self.version = version
                                }
                            }
                        }
                    }
                    // **

                    // **
                    // Intent Color
                    HStack() {
                        Text("Intent color: ")
                            .bold()
                        Button("\(self.intentColor.name)") {
                            self.intentColorSheetIsPresented = true
                        }
                        .confirmationDialog("Select an intent color", isPresented: self.$intentColorSheetIsPresented) {
                            ForEach(ButtonIntentColor.allCases, id: \.self) { intentColor in
                                Button("\(intentColor.name)") {
                                    self.intentColor = intentColor
                                }
                            }
                        }
                    }
                    // **

                    // **
                    // Variant
                    HStack() {
                        Text("Variant: ")
                            .bold()
                        Button("\(self.variant.name)") {
                            self.variantSheetIsPresented = true
                        }
                        .confirmationDialog("Select a variant", isPresented: self.$variantSheetIsPresented) {
                            ForEach(ButtonVariant.allCases, id: \.self) { variant in
                                Button("\(variant.name)") {
                                    self.variant = variant
                                }
                            }
                        }
                    }
                    // **

                    // **
                    // Size
                    HStack() {
                        Text("Size: ")
                            .bold()
                        Button("\(self.size.name)") {
                            self.sizeSheetIsPresented = true
                        }
                        .confirmationDialog("Select a size", isPresented: self.$sizeSheetIsPresented) {
                            ForEach(ButtonSize.allCases, id: \.self) { size in
                                Button("\(size.name)") {
                                    self.size = size
                                }
                            }
                        }
                    }
                    // **

                    // **
                    // Shape
                    HStack() {
                        Text("Shape: ")
                            .bold()
                        Button("\(self.shape.name)") {
                            self.shapeSheetIsPresented = true
                        }
                        .confirmationDialog("Select a shape", isPresented: self.$shapeSheetIsPresented) {
                            ForEach(ButtonShape.allCases, id: \.self) { shape in
                                Button("\(shape.name)") {
                                    self.shape = shape
                                }
                            }
                        }
                    }
                    // **

                    // **
                    // Icon
//                    HStack() {
//                        Text("Icon: ")
//                            .bold()
//                        Button("\(self.icon.name)") {
//                            self.iconSheetIsPresented = true
//                        }
//                        .confirmationDialog("Select a icon", isPresented: self.iconSheetIsPresented) {
//                            ForEach(ButtonIcon.allCases, id: \.self) { icon in
//                                Button("\(icon.name)") {
//                                    self.icon = icon
//                                }
//                            }
//                        }
//                    }
                    // **

                    // Is Enabled
                    HStack() {
                        Text("Is enabled: ")
                            .bold()
                        Toggle("", isOn: self.$isEnabled)
                            .labelsHidden()
                    }

                    // Is text
                    HStack() {
                        Text("Is text: ")
                            .bold()
                        Toggle("", isOn: self.$isText)
                            .labelsHidden()
                    }
                }

                Divider()

                Text("Integration")
                    .font(.title2)
                    .bold()

                if self.version == .swiftUI {
                    Text("Not dev yet !")
                } else {
                    GeometryReader { geometry in
                        ButtonComponentItemsUIView(
                            viewModel: self.viewModel,
                            width: geometry.size.width,
                            height: self.$uiKitViewHeight,
                            intentColor: self.$intentColor.wrappedValue,
                            variant: self.$variant.wrappedValue,
                            size: self.$size.wrappedValue,
                            shape: self.$shape.wrappedValue,
                            icon: self.$icon.wrappedValue,
                            isText: self.$isText.wrappedValue,
                            isEnabled: self.$isEnabled.wrappedValue
                        )
                        .frame(width: geometry.size.width, height: self.uiKitViewHeight, alignment: .center)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarTitle(Text("Button"))
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponentView()
    }
}

// MARK: - Extension

private extension ButtonIntentColor {

    var name: String {
        switch self {
        case .alert:
            return "Alert"
        case .danger:
            return "Danger"
        case .neutral:
            return "Neutral"
        case .primary:
            return "Primary"
        case .secondary:
            return "Secondary"
        case .success:
            return "Success"
        case .surface:
            return "Surface"
        @unknown default:
            return "Please, add this unknow intent color value"
        }
    }
}

private extension ButtonVariant {
    
    var name: String {
        switch self {
        case .filled:
            return "Filled"
        case .outlined:
            return "Outlined"
        case .tinted:
            return "Tinted"
        case .ghost:
            return "Ghost"
        case .contrast:
            return "Contrast"
        @unknown default:
            return "Please, add this unknow variant value"
        }
    }
}


private extension ButtonSize {

    var name: String {
        switch self {
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        @unknown default:
            return "Please, add this unknow variant value"
        }
    }
}

private extension ButtonShape {

    var name: String {
        switch self {
        case .square:
            return "Square"
        case .rounded:
            return "Rounde"
        case .pill:
            return "Pill"
        @unknown default:
            return "Please, add this unknow variant value"
        }
    }
}

private extension ButtonIcon {

//    var name: String {
//        switch self {
//        case .filled:
//            return "Filled"
//        case .outlined:
//            return "Outlined"
//        case .tinted:
//            return "Tinted"
//        case .ghost:
//            return "Ghost"
//        case .contrast:
//            return "Contrast"
//        @unknown default:
//            return "Please, add this unknow variant value"
//        }
//    }
}
