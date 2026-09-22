//
//  IconographyView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct IconographyView: View {

    // MARK: - Properties

    private let items = IconographyItem.all
    private let columns = [GridItem(.adaptive(minimum: 84))]

    @State private var searchText = ""
    @State private var filter: IconographyFilter = .all
    @State private var color: Color = .primary
    @State private var size: IconographySize = .medium
    @State private var showCopiedToast = false
    @State private var showCodeSyntax = false

    private var filteredItems: [IconographyItem] {
        let filtered = self.items.filter {
            self.filter == .all || $0.category == self.filter
        }

        let searched = if self.searchText.isEmpty {
            filtered
        } else {
            filtered.filter {
                $0.name.localizedLowercase.contains(self.searchText.localizedLowercase)
            }
        }

        return searched.sorted { $0.name < $1.name }
    }

    // MARK: - View

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: self.columns, spacing: Spacing.medium.rawValue) {
                    ForEach(self.filteredItems) { item in
                        self.itemView(item)
                    }
                }
                .padding(Spacing.medium.rawValue)
            }
            .overlay {
                if self.filteredItems.isEmpty {
                    Text("No icon found")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationBarTitle("Iconography")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: self.$searchText, prompt: "Search an icon")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Code", systemImage: "curlybraces") {
                        self.showCodeSyntax = true
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    ColorPicker("Color", selection: self.$color)
                        .labelsHidden()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Settings", systemImage: "slider.horizontal.3") {
                        Picker("Filter", selection: self.$filter) {
                            ForEach(IconographyFilter.allCases, id: \.rawValue) { filter in
                                Text(filter.name)
                                    .tag(filter)
                            }
                        }

                        Picker("Size", selection: self.$size) {
                            ForEach(IconographySize.allCases, id: \.rawValue) { size in
                                Text(size.name)
                                    .tag(size)
                            }
                        }
                    }
                }
            }
        }
        .toast("Copied !", isPresented: self.$showCopiedToast)
        .sheet(isPresented: self.$showCodeSyntax, content: {
            CodeSyntaxView(content: IconographyCodeSyntaxes.content)
                .dynamicTypeSize(.large)
        })
    }

    // MARK: - Item View

    private func itemView(_ item: IconographyItem) -> some View {
        VStack(spacing: Spacing.xSmall.rawValue) {
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.size.rawValue, height: self.size.rawValue)
                .foregroundStyle(self.color)

            Text(item.name)
                .font(.caption2)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
    }
}
