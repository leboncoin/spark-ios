//
//  FileUploadPreviewComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias FileUploadPreviewComponentView = ComponentViewable<FileUploadPreviewConfiguration, FileUploadPreviewImplementationView, FileUploadPreviewConfigurationView, FileUploadPreviewExtraTools>

extension FileUploadPreviewComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct FileUploadPreviewImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<FileUploadPreviewConfiguration>
    @State private var showRemoveAlertAction = false

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .alert("Remove tap", isPresented: self.$showRemoveAlertAction) {
                Button("OK", role: .cancel) { }
            }
    }

    @ViewBuilder
    private func component() -> some View {
        let isProgressBar = self.configurationWrapped.isProgressBar
        let isIndeterminateProgressBar = self.configurationWrapped.isIndeterminateProgressBar
        let file: FileUpload = self.configurationWrapped.onError ? .errorMock : .mock

        if isProgressBar {
            if isIndeterminateProgressBar {
                SparkFileUploadPreview(
                    file: file,
                    progressContent: {
                        SparkProgressBarIndeterminate(isAnimated: true)
                    },
                    removeAction: {
                        self.showRemoveAlertAction = true
                    }
                )

            } else {
                SparkFileUploadPreview(
                    file: file,
                    progressContent: {
                        SparkProgressBar(value: 0.75)
                    },
                    removeAction: {
                        self.showRemoveAlertAction = true
                    }
                )
            }

        } else {
            SparkFileUploadPreview(
                file: file,
                removeAction: {
                    self.showRemoveAlertAction = true
                }
            )
        }
    }
}

#Preview {
    FileUploadPreviewComponentView()
}
