//
//  ScaledSnapshotView.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ScaledSnapshotView<ScaledContent, ScaledMetricContent, WithoutScalingContent>: View where ScaledContent: View, ScaledMetricContent: View, WithoutScalingContent: View {

    // MARK: - Properties

    private let backgroundOnContent: Bool

    private let scaledContent: () -> ScaledContent
    private let scaledMetricContent: () -> ScaledMetricContent
    private let withoutScalingContent: () -> WithoutScalingContent

    // MARK: - Initialization

    init(
        backgroundOnContent: Bool = false,
        @ViewBuilder scaledContent: @escaping () -> ScaledContent,
        @ViewBuilder scaledMetricContent: @escaping () -> ScaledMetricContent,
        @ViewBuilder withoutScalingContent: @escaping () -> WithoutScalingContent
    ) {
        self.backgroundOnContent = backgroundOnContent
        self.scaledContent = scaledContent
        self.scaledMetricContent = scaledMetricContent
        self.withoutScalingContent = withoutScalingContent
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {

            ForEach(ScaledState.allCases, id: \.rawValue) { state in

                if !self.isEmptyContent(for: state) {
                    HStack(alignment: .center, spacing: 25) {
                        Text(state.name)
                            .dynamicTypeSize(.xSmall)
                            .fixedSize()

                        HStack(spacing: 25) {
                            switch state {
                            case .scaled: self.scaledContent()
                            case.scaledMetric: self.scaledMetricContent()
                            case .withoutScaling: self.withoutScalingContent()
                            }
                        }
                        .background(self.backgroundOnContent ? .black.opacity(0.2) : .clear)
                    }

                    if !state.isLatest {
                        Divider()
                    }
                }
            }
        }
        .padding(20)
        .background(.gray)
    }

    // MARK: - Getter

    private func isEmptyContent(for state: ScaledState) -> Bool {
        switch state {
        case .scaled: self.scaledContent() is EmptyView
        case.scaledMetric: self.scaledMetricContent() is EmptyView
        case .withoutScaling: self.withoutScalingContent() is EmptyView
        }
    }
}
