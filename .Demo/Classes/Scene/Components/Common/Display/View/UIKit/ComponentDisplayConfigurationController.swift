//
//  ComponentDisplayConfigurationController.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Protocol

protocol ComponentDisplayConfigurationControllerDelegate: AnyObject {
    func presentWillDisappear()
}

// MARK: - View

class ComponentDisplayConfigurationController<Content>: UIHostingController<Content> where Content: View {

    // MARK: - Properties

    weak var delegate: ComponentDisplayConfigurationControllerDelegate?

    // MARK: - Initialization

    override init(rootView: Content) {
        super.init(rootView: rootView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life view cycle

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.delegate?.presentWillDisappear()
    }
}
