//
//  BadgeView.swift
//  SparkCore
//
//  Created by alex.vecherov on 10.05.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import SwiftUI

/// This is SwiftUI badge view to show notifications count
///
/// Badge view is created by pasing:
/// - **Theme**
/// - ``BadgeViewModel``
///
/// **Example**
/// This example shows how to create view with horizontal alignment of Badge
/// ```swift
///    @StateObject var viewModel = BadgeViewModel(
///     theme: SparkTheme.shared,
///     badgeType: .alert,
///     badgeSize: .normal,
///     initValue: 0
///    )
///    @State var value: Int? = 3
///    var body: any View {
///    Button("Change Notifications Number") {
///         viewModel.setBadgeValue(5)
///    }
///    HStack {
///         Text("Some text")
///         BadgeView(viewModel)
///    }
///    }
/// ```
public struct BadgeView: View {
    @ObservedObject public var viewModel: BadgeViewModel

    public var body: some View {
        if viewModel.text.isEmpty {
            Circle()
                .foregroundColor(viewModel.backgroundColor.color)
                .border(
                    width: viewModel.badgeBorder.width,
                    radius: viewModel.badgeBorder.radius,
                    colorToken: viewModel.badgeBorder.color
                )
                .frame(width: viewModel.emptySize.width, height: viewModel.emptySize.height)
        } else {
            Text(viewModel.text)
                .font(viewModel.textFont.font)
                .foregroundColor(viewModel.textColor.color)
            .padding(.init(vertical: viewModel.verticalOffset / 2.0, horizontal: viewModel.horizontalOffset / 2.0))
            .background(viewModel.backgroundColor.color)
            .border(
                width: viewModel.badgeBorder.width,
                radius: viewModel.badgeBorder.radius,
                colorToken: viewModel.badgeBorder.color
            )
        }
    }

    public init(viewModel: BadgeViewModel) {
        self.viewModel = viewModel
    }
}
