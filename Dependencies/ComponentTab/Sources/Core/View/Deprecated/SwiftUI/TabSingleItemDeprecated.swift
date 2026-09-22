//
//  TabSingleItemDeprecated.swift
//  SparkComponentTab
//
//  Created by Michael Zimmermann on 17.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

struct TabSingleItemDeprecated: View {
    let intent: TabIntent
    let content: TabItemContent
    let proxy: ScrollViewProxy
    @Binding var selectedIndex: Int
    let index: Int

    @ObservedObject private var  itemViewModel: TabSegmentViewModelDeprecated<TabItemContent>

    init(viewModel: TabViewModelDeprecated<TabItemContent>, intent: TabIntent, content: TabItemContent, proxy: ScrollViewProxy, selectedIndex: Binding<Int>, index: Int) {
        self.intent = intent
        self.content = content
        self.proxy = proxy
        self._selectedIndex = selectedIndex
        self.index = index

        self.itemViewModel = TabSegmentViewModelDeprecated(
            theme: viewModel.theme,
            intent: intent,
            tabSize: viewModel.tabSize,
            content: content,
            apportionsSegmentWidthsByContent: viewModel.apportionsSegmentWidthsByContent
        )
        .updateState(isSelected: selectedIndex.wrappedValue == index)
        .updateState(isEnabled: viewModel.isTabEnabled(index: index))
    }

    var body: some View {
        TabItemViewDeprecated(viewModel: itemViewModel) {
            self.selectedIndex = self.index
            withAnimation{
                self.proxy.scrollTo(self.content.id)
            }
        }
        .disabled(!self.itemViewModel.isEnabled)
        .id(self.content.id)
        .accessibilityIdentifier("\(TabAccessibilityIdentifier.tabItem)-\(index)")
    }
}
