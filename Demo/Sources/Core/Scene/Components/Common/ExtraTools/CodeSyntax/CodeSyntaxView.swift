//
//  CodeSyntaxView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct CodeSyntaxView: View {

    // MARK: - Properties

    @Environment(\.dismiss) var dismiss

    @State private var showCopiedToast = false
    let content: [CodeSyntax]

    // MARK: - View

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: .large) {
                    ForEach(self.content, id: \.self) { content in
                        VStack(alignment: .leading, spacing: .large) {
                            HStack {
                                // Title
                                Text(content.title)
                                    .font(.title3)
                                    .bold()

                                Spacer()

                                Button("Copy") {
                                    UIPasteboard.general.string = content.code
                                    self.showCopiedToast = true
                                }
                                .buttonStyle(.borderless)
                            }

                            // Code syntax
                            ScrollView(.horizontal) {
                                Text(CodeSyntaxStyle.apply(content.code))
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding(.all, .medium)
                        .background(Color(uiColor: .systemGroupedBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, .medium)
                    }
                }
            }
            .toast("Copied !", isPresented: self.$showCopiedToast)
            .navigationBarTitle("Code Syntax")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}
