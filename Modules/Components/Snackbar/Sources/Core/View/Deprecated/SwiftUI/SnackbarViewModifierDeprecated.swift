//
//  SnackbarViewModifierDeprecated.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 08/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Replaced by SparkSnackbar")
struct SnackbarViewModifierDeprecated<Snackbar: View>: ViewModifier {

    @Binding private var isPresented: Bool
    @State private var currentTask: Task<Void, Never>?

    private let snackbar: (() -> Snackbar)?
    private let direction: SnackbarPresentationDirection
    private let autoDismissDelay: SnackbarAutoDismissDelay?
    private let dismissCompletion: (() -> Void)?

    init(isPresented: Binding<Bool>,
         direction: SnackbarPresentationDirection,
         autoDismissDelay: SnackbarAutoDismissDelay?,
         dismissCompletion: (() -> Void)?,
         snackbar: @escaping () -> Snackbar) {
        self._isPresented = isPresented
        self.direction = direction
        self.autoDismissDelay = autoDismissDelay
        self.dismissCompletion = dismissCompletion
        self.snackbar = snackbar
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                if isPresented {
                    if self.direction == .bottom {
                        Spacer()
                    }
                    self.snackbar?()
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(16)
                        .transition(.move(edge: self.getEdge()).combined(with: .opacity))
                        .transaction { transaction in
                            transaction.disablesAnimations = true // Removes animation issues
                        }
                        .onAppear {
                            if let autoDismissDelay {
                                self.currentTask = Task(priority: .background, operation: {
                                    do {
                                        try await Task.sleep(nanoseconds: UInt64(autoDismissDelay.seconds * powl(10, 9)))
                                        self.isPresented = false
                                    } catch {}
                                })
                            }
                        }
                        .onDisappear {
                            self.dismissCompletion?()
                            self.currentTask?.cancel()
                            self.currentTask = nil
                        }
                    if self.direction == .top {
                        Spacer()
                    }
                }
            }
            .animation(
                self.isPresented ? .easeOut(duration: SnackbarConstants.presentationDuration) : .easeIn(duration: SnackbarConstants.presentationDuration),
                value: self.isPresented
            )
        }
    }

    private func getEdge() -> Edge {
        return switch self.direction {
        case .top: .top
        case .bottom: .bottom
        }
    }
}

