//
//  ButtonGetShowContentUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 18/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Get Show Content Use Case Tests")
struct ButtonGetShowContentUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetShowContentUseCase

    // MARK: - Initialization

    init() {
        self.sut = ButtonGetShowContentUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns true when not loading and type is button and content visibility is showAll")
    func executeReturnsTrueWhenNotLoadingButtonShowAll() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .button,
            contentVisibility: .showAll,
            isLoading: false
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when not loading and type is button and content visibility is hideImage")
    func executeReturnsTrueWhenNotLoadingButtonHideImage() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .button,
            contentVisibility: .hideImage,
            isLoading: false
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when not loading and type is button and content visibility is hideLabel")
    func executeReturnsTrueWhenNotLoadingButtonHideLabel() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .button,
            contentVisibility: .hideLabel,
            isLoading: false
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when not loading and type is iconButton and content visibility is showAll")
    func executeReturnsTrueWhenNotLoadingIconButtonShowAll() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .iconButton,
            contentVisibility: .showAll,
            isLoading: false
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when not loading and type is iconButton and content visibility is hideImage")
    func executeReturnsTrueWhenNotLoadingIconButtonHideImage() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .iconButton,
            contentVisibility: .hideImage,
            isLoading: false
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when not loading and type is iconButton and content visibility is hideLabel")
    func executeReturnsTrueWhenNotLoadingIconButtonHideLabel() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .iconButton,
            contentVisibility: .hideLabel,
            isLoading: false
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when loading and type is button and content visibility is showAll")
    func executeReturnsTrueWhenLoadingButtonShowAll() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .button,
            contentVisibility: .showAll,
            isLoading: true
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns true when loading and type is button and content visibility is hideImage")
    func executeReturnsTrueWhenLoadingButtonHideImage() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .button,
            contentVisibility: .hideImage,
            isLoading: true
        )

        // THEN
        #expect(result == true)
    }

    @Test("Execute returns false when loading and type is button and content visibility is hideLabel")
    func executeReturnsFalseWhenLoadingButtonHideLabel() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .button,
            contentVisibility: .hideLabel,
            isLoading: true
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns false when loading and type is iconButton and content visibility is showAll")
    func executeReturnsFalseWhenLoadingIconButtonShowAll() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .iconButton,
            contentVisibility: .showAll,
            isLoading: true
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns false when loading and type is iconButton and content visibility is hideImage")
    func executeReturnsFalseWhenLoadingIconButtonHideImage() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .iconButton,
            contentVisibility: .hideImage,
            isLoading: true
        )

        // THEN
        #expect(result == false)
    }

    @Test("Execute returns false when loading and type is iconButton and content visibility is hideLabel")
    func executeReturnsFalseWhenLoadingIconButtonHideLabel() throws {
        // GIVEN / WHEN
        let result = self.sut.execute(
            type: .iconButton,
            contentVisibility: .hideLabel,
            isLoading: true
        )

        // THEN
        #expect(result == false)
    }
}
