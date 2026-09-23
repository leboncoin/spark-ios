//
//  FileUploadPreviewImageViewer.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkComponentSpinner

struct FileUploadPreviewImageViewer: View {

    // MARK: - Properties

    let url: URL

    @Environment(\.theme) private var theme

    // MARK: - View

    var body: some View {
        ImageViewRepresentable(
            theme: self.theme.value,
            url: self.url
        )
    }
}

// MARK: - View Representable

private struct ImageViewRepresentable: UIViewRepresentable {

    // MARK: - Properties

    let theme: any Theme
    let url: URL

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> ZoomableImageView {
        return ZoomableImageView(theme: self.theme)
    }

    func updateUIView(_ uiView: ZoomableImageView, context: Context) {
        uiView.loadImage(from: self.url)
    }
}

// MARK: - ZoomableImageView

private final class ZoomableImageView: UIView {

    // MARK: - Components

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(self.imageView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesZoom = true
        scrollView.decelerationRate = .fast
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10
        scrollView.delegate = self
        return scrollView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var spinner: SparkUISpinner = {
        let spinner = SparkUISpinner(theme: self.theme)
        spinner.isHidden = true
        return spinner
    }()

    // MARK: - Properties

    private let theme: any Theme
    private var imageViewWidthConstraint: NSLayoutConstraint?
    private var imageViewHeightConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Add subviews
        self.addSubview(self.scrollView)
        self.addSubview(self.spinner)

        // Constraints
        self.setupConstraints()

        // Gesture
        self.setupGesture()
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        if let image = self.imageView.image {
            self.updateImageViewConstraints(for: image)
        }
        self.centerImage()
    }

    // MARK: - Constraints

    func setupConstraints() {
        self.setupScrollViewConstraints()
        self.setupSpinnerConstraints()
        self.setupImageViewConstraints()
    }

    func setupScrollViewConstraints() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.scrollView,
            to: self
        )
    }

    func setupSpinnerConstraints() {
        self.spinner.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.center(
            from: self.spinner,
            to: self
        )
    }

    func setupImageViewConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false

        self.imageViewWidthConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 0)
        self.imageViewHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.stickEdges(
            from: self.imageView,
            to: self.scrollView
        )

        NSLayoutConstraint.activate([
            self.imageViewWidthConstraint,
            self.imageViewHeightConstraint
        ].compactMap { $0 })
    }

    // MARK: - Gesture

    func setupGesture() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureAction(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        self.scrollView.addGestureRecognizer(doubleTapGesture)
    }

    @objc private func tapGestureAction(_ gesture: UITapGestureRecognizer) {
        if self.scrollView.zoomScale > self.scrollView.minimumZoomScale {
            // Zoom out
            self.scrollView.setZoomScale(self.scrollView.minimumZoomScale, animated: true)
        } else {
            // Zoom in at tap location
            let location = gesture.location(in: self.imageView)
            let zoomScale = self.scrollView.maximumZoomScale / 2

            let scrollViewSize = self.scrollView.bounds.size
            let width = scrollViewSize.width / zoomScale
            let height = scrollViewSize.height / zoomScale
            let x = location.x - (width / 2)
            let y = location.y - (height / 2)

            let zoomRect = CGRect(x: x, y: y, width: width, height: height)
            self.scrollView.zoom(to: zoomRect, animated: true)
        }
    }

    // MARK: - Public Methods

    func loadImage(from url: URL) {
        self.spinner.isHidden = false

        Task { @MainActor in
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let image = UIImage(data: data) else {
                    self.spinner.isHidden = true
                    return
                }
                self.setImage(image)
                self.spinner.isHidden = true
            } catch {
                self.spinner.isHidden = true
            }
        }
    }

    // MARK: - Update UI

    private func setImage(_ image: UIImage) {
        self.imageView.image = image
        self.updateImageViewConstraints(for: image)
        self.centerImage()
    }

    private func updateImageViewConstraints(for image: UIImage) {
        let imageSize = image.size
        let viewSize = self.bounds.size

        guard viewSize.width > 0 && viewSize.height > 0 else { return }

        let widthRatio = viewSize.width / imageSize.width
        let heightRatio = viewSize.height / imageSize.height
        let ratio = min(widthRatio, heightRatio)

        let scaledWidth = imageSize.width * ratio
        let scaledHeight = imageSize.height * ratio

        self.imageViewWidthConstraint?.constant = scaledWidth
        self.imageViewHeightConstraint?.constant = scaledHeight

        self.scrollView.contentSize = CGSize(width: scaledWidth, height: scaledHeight)
        self.layoutIfNeeded()
    }

    private func centerImage() {
        let scrollViewSize = self.scrollView.bounds.size
        let imageViewSize = self.imageView.frame.size

        let horizontalInset = max(0, (scrollViewSize.width - imageViewSize.width) / 2)
        let verticalInset = max(0, (scrollViewSize.height - imageViewSize.height) / 2)

        self.scrollView.contentInset = UIEdgeInsets(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
    }
}

// MARK: - UIScrollViewDelegate

extension ZoomableImageView: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.centerImage()
    }
}
