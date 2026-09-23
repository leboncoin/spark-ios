//
//  TextEditorUIViewModel.swift
//  SparkEditor
//
//  Created by robin.lemaire on 05/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
/// UseCase only used by **UIKit** TextEditor View.
final class TextEditorUIViewModel: TextInputUIViewModel {

    // MARK: - Published Properties

    @Published private(set) var shouldShowPlaceholder: Bool = true
    @Published private(set) var updateVerticalSpacingCounter: Int = 0

    // MARK: - Private Properties

    private let getVerticalSpacingUseCase: any TextEditorGetVerticalSpacingUseCaseable

    // MARK: - Initialization

    init(
        theme: any Theme,
        intent: TextEditorIntent,
        getVerticalSpacingUseCase: any TextEditorGetVerticalSpacingUseCaseable = TextEditorGetVerticalSpacingUseCase()
    ) {
        self.getVerticalSpacingUseCase = getVerticalSpacingUseCase

        super.init(theme: theme, intent: intent, borderStyle: .roundedRect)
    }

    // MARK: - Update

    func contentChanged(with text: String?) {
        self.shouldShowPlaceholder = (text?.isEmpty ?? true)
    }

    // MARK: - Getter

    func getVerticalSpacing(from height: CGFloat) -> CGFloat {
        self.getVerticalSpacingUseCase.execute(
            height: height,
            font: self.font
        )
    }

    // MARK: - Setter

    override func setFont() {
        super.setFont()

        self.updateVerticalSpacingCounter += 1
    }
}
