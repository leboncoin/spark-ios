//
//  FileUploadCameraPicker.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 01/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

struct FileUploadCameraPicker: UIViewControllerRepresentable {

    // MARK: - Properties

    @Binding var isPresented: Bool
    let onImageCaptured: (UIImage) -> Void

    // MARK: - UIViewControllerRepresentable

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: - Coordinator

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        // MARK: - Properties

        private let parent: FileUploadCameraPicker

        // MARK: - Initialization

        init(_ parent: FileUploadCameraPicker) {
            self.parent = parent
        }

        // MARK: - UIImagePickerControllerDelegate

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let image = info[.originalImage] as? UIImage {
                self.parent.onImageCaptured(image)
            }
            self.parent.isPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.isPresented = false
        }
    }
}
