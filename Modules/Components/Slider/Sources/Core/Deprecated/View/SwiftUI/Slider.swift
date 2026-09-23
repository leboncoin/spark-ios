//
//  Slider.swift
//  SparkComponentSlider
//
//  Created by louis.borlee on 15/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Use SparkSlider instead")
public struct Slider<V>: View where V: BinaryFloatingPoint, V.Stride: BinaryFloatingPoint {

    @ObservedObject private var viewModel: SingleSliderViewModelDeprecated<V>

    @State private var isEditing: Bool = false

    @Binding var value: V

    private var onEditingChanged: (Bool) -> Void

    private init(value: Binding<V>,
                 in bounds: ClosedRange<V>,
                 step: V.Stride?,
                 theme: any Theme,
                 shape: SliderShape,
                 intent: SliderIntent,
                 onEditingChanged: @escaping (Bool) -> Void = { _ in }) {
        self._value = value

        let viewModel = SingleSliderViewModelDeprecated<V>(theme: theme, shape: shape, intent: intent)
        viewModel.bounds = bounds
        viewModel.step = step
        viewModel.resetBoundsIfNeeded()
        viewModel.setValue(value.wrappedValue)

        self.viewModel = viewModel

        self.onEditingChanged = onEditingChanged
    }

    public init(theme: any Theme,
                shape: SliderShape,
                intent: SliderIntent,
                value: Binding<V>,
                in bounds: ClosedRange<V> = 0...1,
                onEditingChanged: @escaping (Bool) -> Void = { _ in }) {
        self.init(value: value,
                  in: bounds,
                  step: nil,
                  theme: theme,
                  shape: shape,
                  intent: intent,
                  onEditingChanged: onEditingChanged)
    }

    public init(theme: any Theme,
                shape: SliderShape,
                intent: SliderIntent,
                value: Binding<V>,
                in bounds: ClosedRange<V> = 0...1,
                step: V.Stride = 1,
                onEditingChanged: @escaping (Bool) -> Void = { _ in }) {
        self.init(value: value,
                  in: bounds,
                  step: step != .zero ? step : nil,
                  theme: theme,
                  shape: shape,
                  intent: intent,
                  onEditingChanged: onEditingChanged)
    }

    public var body: some View {
        GeometryReader(content: { geometry in
            let sliderHandleCenterX = self.getHandleXPosition(frameWidth: geometry.size.width)
            ZStack {
                HStack(spacing: .zero) {
                    RoundedRectangle(cornerRadius: self.viewModel.indicatorRadius)
                        .foregroundColor(self.viewModel.indicatorColor.color)
                        .frame(width: sliderHandleCenterX)
                    RoundedRectangle(cornerRadius: self.viewModel.trackRadius)
                        .foregroundColor(self.viewModel.trackColor.color)
                }
                .frame(height: SliderConstantsDeprecated.barHeight)
                SliderHandleDeprecated(
                    viewModel: .init(color: self.viewModel.handleColor, activeIndicatorColor: self.viewModel.handleActiveIndicatorColor),
                    isEditing: self.$isEditing)
                .position(x: sliderHandleCenterX,
                          y: geometry.size.height / 2.0)
            }
            .gesture(
                DragGesture(minimumDistance: .zero)
                    .onChanged { value in
                        self.isEditing = true
                        self.moveHandle(to: value.location.x, width: geometry.size.width)
                    }
                    .onEnded { value in
                        self.isEditing = false
                    }
            )
        })
        .compositingGroup()
        .opacity(self.viewModel.dim)
        .frame(height: SliderConstantsDeprecated.handleSize.height)
        .onChange(of: self.isEditing, perform: { value in
            self.onEditingChanged(value)
        })
        .onChange(of: self.viewModel.value, perform: { value in
            self.value = value
        })
        .isEnabledChanged { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
        .accessibilityElement()
        .accessibilityIdentifier(SliderAccessibilityIdentifier.slider)
        .accessibilityValue(self.getAccessibilityValue())
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .decrement:
                self.viewModel.decrementValue()
            case .increment:
                self.viewModel.incrementValue()
            @unknown default:
                break
            }
        }
    }

    private func moveHandle(to: CGFloat, width: CGFloat) {
        let absoluteX = max(SliderConstantsDeprecated.handleSize.width / 2, min(to, width - SliderConstantsDeprecated.handleSize.width / 2))
        let relativeX = (absoluteX - SliderConstantsDeprecated.handleSize.width / 2) / (width - SliderConstantsDeprecated.handleSize.width)
        let newValue = V(relativeX) * (self.viewModel.bounds.upperBound - self.viewModel.bounds.lowerBound) + self.viewModel.bounds.lowerBound
        self.viewModel.setValue(newValue)
    }

    private func getHandleXPosition(frameWidth: CGFloat) -> CGFloat {
        guard self.viewModel.bounds.lowerBound != self.viewModel.bounds.upperBound else {
            return SliderConstantsDeprecated.handleSize.width / 2
        }
        let value = (max(self.viewModel.bounds.lowerBound, self.value) - self.viewModel.bounds.lowerBound) / (self.viewModel.bounds.upperBound - self.viewModel.bounds.lowerBound)
        return (frameWidth - SliderConstantsDeprecated.handleSize.width) * CGFloat(value) + SliderConstantsDeprecated.handleSize.width / 2
    }

    private func getAccessibilityValue() -> String {
        let percentage = ((self.value - self.viewModel.bounds.lowerBound) * 100) / (self.viewModel.bounds.upperBound - self.viewModel.bounds.lowerBound)
        return "\(Int(round(percentage)))%"
    }
}
