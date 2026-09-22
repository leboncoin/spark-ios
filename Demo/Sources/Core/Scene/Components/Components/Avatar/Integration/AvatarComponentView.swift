//
//  AvatarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentAvatar

// MARK: - View

typealias AvatarComponentView = ComponentViewable<AvatarConfiguration, AvatarImplementationView, AvatarConfigurationView, AvatarExtraTools>

// MARK: - Subview

struct AvatarImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<AvatarConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkAvatarSize(self.configurationWrapped.size)
            .sparkAvatarActionType(self.configurationWrapped.cornerType == .button ? self.configurationWrapped.actionType : nil)
            .sparkAvatarIsBorder(self.configurationWrapped.isBorder)
            .sparkBadgeIntent(self.configurationWrapped.badgeIntent)
            .demoAccessibilityLabel(self.configurationWrapped)
            .alert("Avatar Tapped", isPresented: self.$showAlertAction) {
                Button("OK", role: .cancel) {
                }
            }
    }

    @ViewBuilder
    private func component() -> some View {
        switch self.configurationWrapped.type {
        case .user:
            self.userAvatar()
        case .company:
            self.companyAvatar()
        }
    }

    // MARK: - User Avatar

    @ViewBuilder
    private func userAvatar() -> some View {
        let source = self.configurationWrapped.source
        let cornerType = self.configurationWrapped.cornerType
        let isAction = self.configurationWrapped.isAction
        let url: URL = .userURL(urlContainsImage: self.configurationWrapped.urlContainsImage)

        switch (source, cornerType, isAction) {
        // Image source, no corner, no action
        case (.image, nil, false):
            SparkUserAvatar(
                image: Image(.user),
                placeholder: self.configurationWrapped.username
            )

        // Image source, no corner, with action
        case (.image, nil, true):
            SparkUserAvatar(
                image: Image(.user),
                placeholder: self.configurationWrapped.username,
                action: {
                    self.showAlertAction = true
                }
            )

        // Image source, badge corner, no action
        case (.image, .badge, false):
            SparkUserAvatar(
                image: Image(.user),
                placeholder: self.configurationWrapped.username
            ) {
                SparkBadge()
            }

        // Image source, badge corner, with action
        case (.image, .badge, true):
            SparkUserAvatar(
                image: Image(.user),
                placeholder: self.configurationWrapped.username,
                action: {
                    self.showAlertAction = true
                }
            ) {
                SparkBadge()
            }

        // Image source, button corner, no action
        case (.image, .button, false):
            SparkUserAvatar(
                image: Image(.user),
                placeholder: self.configurationWrapped.username
            )

        // Image source, button corner, with action
        case (.image, .button, true):
            SparkUserAvatar(
                image: Image(.user),
                placeholder: self.configurationWrapped.username,
                action: {
                    self.showAlertAction = true
                }
            )

        // URL source, no corner, no action
        case (.url, nil, false):
            SparkUserAvatar(
                url: url,
                placeholder: self.configurationWrapped.username
            )

        // URL source, no corner, with action
        case (.url, nil, true):
            SparkUserAvatar(
                url: url,
                placeholder: self.configurationWrapped.username,
                action: {
                    self.showAlertAction = true
                }
            )

        // URL source, badge corner, no action
        case (.url, .badge, false):
            SparkUserAvatar(
                url: url,
                placeholder: self.configurationWrapped.username
            ) {
                SparkBadge()
            }

        // URL source, badge corner, with action
        case (.url, .badge, true):
            SparkUserAvatar(
                url: url,
                placeholder: self.configurationWrapped.username,
                action: {
                    self.showAlertAction = true
                }
            ) {
                SparkBadge()
            }

        // URL source, button corner, no action
        case (.url, .button, false):
            SparkUserAvatar(
                url: url,
                placeholder: self.configurationWrapped.username
            )

        // URL source, button corner, with action
        case (.url, .button, true):
            SparkUserAvatar(
                url: url,
                placeholder: self.configurationWrapped.username,
                action: {
                    self.showAlertAction = true
                }
            )
        }
    }

    // MARK: - Company Avatar

    @ViewBuilder
    private func companyAvatar() -> some View {
        let source = self.configurationWrapped.source
        let cornerType = self.configurationWrapped.cornerType
        let isAction = self.configurationWrapped.isAction
        let url: URL = .companyURL(urlContainsImage: self.configurationWrapped.urlContainsImage)

        switch (source, cornerType, isAction) {
        // Image source, no corner, no action
        case (.image, nil, false):
            SparkCompanyAvatar(image: Image(.logo))

        // Image source, no corner, with action
        case (.image, nil, true):
            SparkCompanyAvatar(
                image: Image(.logo),
                action: {
                    self.showAlertAction = true
                }
            )

        // Image source, badge corner, no action
        case (.image, .badge, false):
            SparkCompanyAvatar(image: Image(.logo)) {
                SparkBadge()
            }

        // Image source, badge corner, with action
        case (.image, .badge, true):
            SparkCompanyAvatar(
                image: Image(.logo),
                action: {
                    self.showAlertAction = true
                }
            ) {
                SparkBadge()
            }

        // Image source, button corner, no action
        case (.image, .button, false):
            SparkCompanyAvatar(image: Image(.logo))

        // Image source, button corner, with action
        case (.image, .button, true):
            SparkCompanyAvatar(
                image: Image(.logo),
                action: {
                    self.showAlertAction = true
                }
            )

        // URL source, no corner, no action
        case (.url, nil, false):
            SparkCompanyAvatar(url: url)

        // URL source, no corner, with action
        case (.url, nil, true):
            SparkCompanyAvatar(
                url: url,
                action: {
                    self.showAlertAction = true
                }
            )

        // URL source, badge corner, no action
        case (.url, .badge, false):
            SparkCompanyAvatar(url: url) {
                SparkBadge()
            }

        // URL source, badge corner, with action
        case (.url, .badge, true):
            SparkCompanyAvatar(
                url: url,
                action: {
                    self.showAlertAction = true
                }
            ) {
                SparkBadge()
            }

        // URL source, button corner, no action
        case (.url, .button, false):
            SparkCompanyAvatar(url: url)

        // URL source, button corner, with action
        case (.url, .button, true):
            SparkCompanyAvatar(
                url: url,
                action: {
                    self.showAlertAction = true
                }
            )
        }
    }
}

// MARK: - Extension

private extension URL {

    static func userURL(urlContainsImage: Bool) -> URL {
        return urlContainsImage ? .userURL : .noImageURL
    }

    static func companyURL(urlContainsImage: Bool) -> URL {
        return urlContainsImage ? .companyURL : .noImageURL
    }

    private static var userURL: URL {
        guard let url = URL(string: "https://www.rainforest-alliance.org/wp-content/uploads/2021/06/blue-morpho-butterfly-1-400x400.jpg.optimal.jpg") else {
            fatalError()
        }

        return url
    }

    private static var companyURL: URL {
        guard let url = URL(string: "https://img3.wallspic.com/previews/2/0/1/3/6/163102/163102-apple-logo_apple_face_a_steve_jobs-logo-clip_art-graphique-x750.jpg") else {
            fatalError()
        }

        return url
    }

    private static var noImageURL: URL {
        guard let url = URL(string: "https://www.apple.com/") else {
            fatalError()
        }

        return url
    }
}
