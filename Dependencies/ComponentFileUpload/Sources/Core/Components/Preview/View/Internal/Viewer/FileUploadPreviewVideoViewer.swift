//
//  FileUploadPreviewVideoViewer.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 31/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import AVKit

struct FileUploadPreviewVideoViewer: View {

    // MARK: - Properties

    let player: AVPlayer

    // MARK: - Initialization

    init(url: URL) {
        self.player = .init(url: url)
    }

    // MARK: - View

    var body: some View {
        VideoPlayer(player: self.player)
            .onAppear {
                self.player.play()
            }
    }
}
