//
//  SparkCard+InitExtension.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 15/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkCard {

    /// Creates a card without a header.
    ///
    /// - Parameters:
    ///   - content: The content of the card.
    ///   - action: The action on tap. *Optional*. Default is **nil**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkCard {
    ///     VStack(alignment: .leading) {
    ///         HStack {
    ///             Image(systemName: "info.circle")
    ///             Text("Welcome on Card")
    ///         }
    ///
    ///         Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis.")
    ///             .multilineTextAlignment(.leading)
    ///     }
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkCardIntent(.success)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ### Header
    ///
    /// | Default | Is highlighted |
    /// |:---:|:---:|
    /// | ![Default](card_classic.png) | ![is highlight](card_with_highlight.png) |
    ///
    /// ### With Header
    ///
    /// | Banner | Border |
    /// |:---:|:---:|
    /// | ![Banner header](card_with_banner_header.png) | ![Border header](card_with_border_header.png) |
    ///
    init(
        @ViewBuilder content: @escaping () -> Content,
        action: (() -> Void)? = nil
    ) where Header == EmptyView {
        self.init(
            isHeader: false,
            header: { EmptyView() },
            content: content,
            action: action
        )
    }

    /// Creates a card with a text header.
    ///
    /// - Parameters:
    ///   - header: The text header of the card.
    ///   - content: The content of the card.
    ///   - action: The action on tap. *Optional*. Default is **nil**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkCard(header: "Card Title") {
    ///     VStack(alignment: .leading) {
    ///         Text("Card description goes here.")
    ///             .multilineTextAlignment(.leading)
    ///     }
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkCardIntent(.main)
    /// .sparkCardHeaderPosition(.banner)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ### Header
    ///
    /// | Default | Is highlighted |
    /// |:---:|:---:|
    /// | ![Default](card_classic.png) | ![is highlight](card_with_highlight.png) |
    ///
    /// ### With Header
    ///
    /// | Banner | Border |
    /// |:---:|:---:|
    /// | ![Banner header](card_with_banner_header.png) | ![Border header](card_with_border_header.png) |
    ///
    init(
        header: String,
        @ViewBuilder content: @escaping () -> Content,
        action: (() -> Void)? = nil
    ) where Header == Text {
        self.init(
            isHeader: true,
            header: { Text(header) },
            content: content,
            action: action
        )
    }

    /// Create a card with header and content.
    ///
    /// This is the base initializer that all convenience initializers delegate to.
    ///
    /// - Parameters:
    ///   - header: The header of the card.
    ///   - content: The content of the card.
    ///   - action: The action on tap. *Optional*. Default is **nil**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkCard(
    ///     header: {
    ///         HStack {
    ///             Image(systemName: "star.fill")
    ///             Text("Premium Content")
    ///         }
    ///     },
    ///     content: {
    ///         VStack(alignment: .leading) {
    ///             Text("This is a card with a custom header.")
    ///                 .multilineTextAlignment(.leading)
    ///         }
    ///     },
    ///     action: {
    ///         // Handle card tap
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkCardIntent(.main)
    /// .sparkCardHeaderPosition(.banner)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ### Header
    ///
    /// | Default | Is highlighted |
    /// |:---:|:---:|
    /// | ![Default](card_classic.png) | ![is highlight](card_with_highlight.png) |
    ///
    /// ### With Header
    ///
    /// | Banner | Border |
    /// |:---:|:---:|
    /// | ![Banner header](card_with_banner_header.png) | ![Border header](card_with_border_header.png) |
    ///
    init(
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        action: (() -> Void)? = nil
    ) {
        self.init(
            isHeader: true,
            header: header,
            content: content,
            action: action
        )
    }
}
