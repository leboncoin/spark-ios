//
//  FileUploadPreviewGroupComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadPreviewGroupComponentView: View {

    // MARK: - Properties

    let theme = DemoThemes.shared.mainTheme
    @State private var files: [FileUpload] = [
        .mock,
        .errorMock
    ]

    // MARK: - View

    var body: some View {
        VStack {
            SparkFileUploadPreviewGroup(files: self.$files)

            Spacer()
        }
        .sparkTheme(self.theme.value)
        .padding(.all, .medium)
    }
}

#Preview {
    FileUploadPreviewGroupComponentView()
}
