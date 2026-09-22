//
//  FileUploadComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadComponentView: View {

    // MARK: - Properties

    let theme = DemoThemes.shared.mainTheme
    @State private var files: [FileUpload] = []

    // MARK: - View

    var body: some View {
        SparkVStack(spacing: self.theme.value.layout.spacing.medium) {
            SparkFileUploadDropzone(
                icon: .init(.export),
                descriptionText: "Drag and drop a file or",
                additionalText: "all files up to 5MB",
                files: self.$files,
                uploadButton: {

                    SparkFileUploadButton(
                        "Browse my files",
                        files: self.$files,
                        fileAllowsMultipleSelection: true
                    )
                }
            )

            SparkFileUploadPreviewGroup(files: self.$files)

            Spacer()
        }
        .sparkTheme(self.theme.value)
        .padding(.all, .medium)
    }
}

#Preview {
    FileUploadComponentView()
}
