//
//  FileUploadComponentsView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FileUploadComponentsView: View {

    // MARK: - Properties

    var body: some View {
        List {
            ForEach(FileUploadComponents.allCases, id: \.rawValue) { component in
                NavigationLink(component.name, value: component)
            }
        }
        .navigationDestination(for: FileUploadComponents.self, destination: { component in
            switch component {
            case .button: FileUploadButtonComponentView()
            case .dropzone: FileUploadDropzoneComponentView()
            case .preview: FileUploadPreviewComponentView()
            case .previewGroup: FileUploadPreviewGroupComponentView()
            case .all: FileUploadComponentView()
            }
        })
    }
}

#Preview {
    FileUploadComponentsView()
}
