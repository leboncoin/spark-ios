//
//  ScaledUIMetricTests.swift
//  SparkCore
//
//  Created by janniklas.freundt.ext on 05.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import SwiftUI
import Testing
@_spi(SI_SPI) @testable import SparkCommon

@Suite("Scaled UI Metric Tests")
@MainActor
final class ScaledUIMetricTests {

    // MARK: - Properties

    @ScaledUIMetric(traitCollection: UITraitCollection(preferredContentSizeCategory: .medium)) var basicMetric: CGFloat = 11
    @ScaledUIMetric(relativeTo: .body) var bodyMetric: CGFloat = 22
    @ScaledUIMetric(relativeTo: .largeTitle) var titleMetric: CGFloat = 0
    @ScaledUIMetric var zeroMetric: CGFloat = 0
    @ScaledUIMetric var comparisonMetric: CGFloat = 10
    @ScaledUIMetric var comparisonMetricExtraLarge: CGFloat = 10

    // MARK: - Tests
    @Test("Property wrapper basic")
    func propertyWrapperBasic() throws {
        // Then
        #expect(abs(self.basicMetric - 10.666) <= 0.1, "wrong scaled value")

        // Given
        self.basicMetric = 110

        // Then
        #expect(abs(self.basicMetric - 105) <= 0.1, "wrong scaled value")
    }

    @Test("Property wrapper body")
    func propertyWrapperBody() throws {
        // Given
        self._bodyMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge))

        // Then
        #expect(abs(self.bodyMetric - 62.0) <= 0.1, "wrong scaled value")

        // Given
        self._bodyMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: .extraSmall))

        // Then
        #expect(abs(self.bodyMetric - 19.0) <= 0.1, "wrong scaled value")
    }

    @Test("Property wrapper large title")
    func propertyWrapperLargeTitle() throws {
        // Given
        titleMetric = 22
        self._titleMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge))

        // Then
        #expect(abs(self.titleMetric - 37.66) <= 0.1, "wrong scaled value")

        // Given
        self._titleMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: .extraSmall))

        // Then
        #expect(abs(self.titleMetric - 20.333) <= 0.1, "wrong scaled value")
    }

    @Test("Property wrapper zero")
    func propertyWrapperZero() throws {
        // Given
        self._zeroMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge))

        // Then
        #expect(self.zeroMetric == 0, "wrong scaled value")

        // Given
        self._zeroMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: .extraSmall))

        // Then
        #expect(self.zeroMetric == 0, "wrong scaled value")
    }

    /// Compares the result of SwiftUI `ScaledMetric` with the result of `ScaledUIMetric`.
    @Test("Property wrapper behaves like SwiftUI scaled metric")
    func propertyWrapperBehavesLikeSwiftUIScaledMetric() async throws {
        // Given
        let size = UIContentSizeCategory.extraLarge
        self._comparisonMetric.update(traitCollection: UITraitCollection(preferredContentSizeCategory: size))

        // Then
        let swiftUISize: CGFloat = try await withCheckedThrowingContinuation { continuation in
            var isResumed = false
            do {
                try self.givenSwiftUIView(size: size, didAppearHandler: { swiftUISize in
                    guard !isResumed else { return }
                    isResumed = true
                    continuation.resume(returning: swiftUISize)
                })
            } catch {
                continuation.resume(throwing: error)
            }
        }
        #expect(abs(self.comparisonMetric - swiftUISize) <= 0.1, "ScaledMetric and ScaledUIMetric produce different values")
    }

    /// Compares the result of SwiftUI `ScaledMetric` with the result of `ScaledUIMetric`.
    @Test("Property wrapper behaves like SwiftUI scaled metric extra large")
    func propertyWrapperBehavesLikeSwiftUIScaledMetricExtraLarge() async throws {
        // Given
        let size = UIContentSizeCategory.accessibilityExtraExtraExtraLarge
        self._comparisonMetricExtraLarge.update(traitCollection: UITraitCollection(preferredContentSizeCategory: size))

        // Then
        let swiftUISize: CGFloat = try await withCheckedThrowingContinuation { continuation in
            var isResumed = false
            do {
                try self.givenSwiftUIView(size: size, didAppearHandler: { swiftUISize in
                    guard !isResumed else { return }
                    isResumed = true
                    continuation.resume(returning: swiftUISize)
                })
            } catch {
                continuation.resume(throwing: error)
            }
        }
        #expect(abs(self.comparisonMetricExtraLarge - swiftUISize) <= 0.1, "ScaledMetric and ScaledUIMetric produce different values")
    }

    // MARK: - Helper

    private func givenSwiftUIView(size: UIContentSizeCategory, didAppearHandler: @escaping ((_ value: CGFloat) -> Void)) throws {
        let size = try #require(ContentSizeCategory(size))

        let window = UIWindow()

        let view =
            TestView(didAppearHandler: { swiftUIValue in
                didAppearHandler(swiftUIValue)
                window.removeFromSuperview()
            })
            .environment(\.sizeCategory, size)

        let viewController = UIHostingController(rootView: view)

        // Simulate the view appearance
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

// MARK: - Test view to compare with SwiftUI ScaledMetric
private struct TestView: View {
    // MARK: - Properties

    /// We have to wrap the `ScaledMetric`inside a view. Other configurations are not supported.
    @ScaledMetric var value: CGFloat = 10

    var didAppearHandler: ((_ value: CGFloat) -> Void)?

    // MARK: - Body
    var body: some View {
        EmptyView()
            .onAppear {
                self.didAppearHandler?(value)
            }
    }
}
