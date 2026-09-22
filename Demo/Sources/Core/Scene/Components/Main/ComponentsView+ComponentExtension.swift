//
//  ComponentsView+ComponentExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension ComponentsView {

    enum Component: String, CaseIterable, Hashable {
        case adaptativeStack
        case avatar
        case awarenessCard
        case badge
        case border
        case borderRadius
        case bottomSheet
        case button
        case card
        case checkbox
        case checkboxGroup
        case chip
        case circularMeter
        case cornerRadius
        case divider
        case fileUpload
        case formField
        case icon
        case inputOTP
        case microAnimation
        case popover
        case progressBar
        case progressBarIndeterminate
        case progressTracker
        case radioButton
        case radioGroup
        case ratingDisplay
        case ratingInput
        case segmentedControl
        case segmentedGauge
        case slider
        case snackbar
        case spinner
        case stepper
        case tab
        case tag
        case textEditor
        case textField
        case textFieldAddons
        case textLink
        case toggle

        // MARK: - Properties

        var familly: Familly {
            switch self {
            case .adaptativeStack: .style
            case .avatar: .visualAsset
            case .awarenessCard: .layout
            case .badge: .indicator
            case .border: .style
            case .borderRadius: .style
            case .bottomSheet: .overlays
            case .button: .action
            case .card: .layout
            case .checkbox: .dataInput
            case .checkboxGroup: .dataInput
            case .chip: .dataInput
            case .circularMeter: .indicator
            case .cornerRadius: .style
            case .divider: .layout
            case .fileUpload: .dataInput
            case .formField: .dataInput
            case .icon: .visualAsset
            case .inputOTP: .dataInput
            case .microAnimation: .other
            case .popover: .overlays
            case .progressBar: .indicator
            case .progressBarIndeterminate: .indicator
            case .progressTracker: .indicator
            case .radioButton: .dataInput
            case .radioGroup: .dataInput
            case .ratingDisplay: .indicator
            case .ratingInput: .dataInput
            case .segmentedControl: .dataInput
            case .segmentedGauge: .indicator
            case .slider: .dataInput
            case .snackbar: .overlays
            case .spinner: .indicator
            case .stepper: .dataInput
            case .tab: .navigation
            case .tag: .layout
            case .textEditor: .dataInput
            case .textField: .dataInput
            case .textFieldAddons: .dataInput
            case .textLink: .action
            case .toggle: .dataInput
            }
        }

        var accessibilityStatus: AccessibilityStatus {
            switch self {
            case .adaptativeStack: .available
            case .avatar: .available
            case .awarenessCard: .available
            case .badge: .available
            case .border: .available
            case .borderRadius: .available
            case .bottomSheet: .none
            case .button: .available
            case .card: .available
            case .checkbox: .available
            case .checkboxGroup: .available
            case .chip: .available
            case .circularMeter: .available
            case .cornerRadius: .available
            case .divider: .available
            case .fileUpload: .available
            case .formField: .available
            case .icon: .available
            case .inputOTP: .available
            case .microAnimation: .none
            case .popover: .unavailable
            case .progressBar: .available
            case .progressBarIndeterminate: .available
            case .progressTracker: .unavailable
            case .radioButton: .available
            case .radioGroup: .available
            case .ratingDisplay: .available
            case .ratingInput: .available
            case .segmentedControl: .available
            case .segmentedGauge: .available
            case .slider: .available
            case .snackbar: .available
            case .spinner: .available
            case .stepper: .available
            case .tab: .available
            case .tag: .available
            case .textEditor: .available
            case .textField: .available
            case .textFieldAddons: .available
            case .textLink: .available
            case .toggle: .available
            }
        }

        private var illustration: Image? {
            switch self {
            case .avatar: .init(.avatar)
            case .awarenessCard: .init(.awarenessCard)
            case .badge: .init(.badge)
            case .button: .init(.button)
            case .bottomSheet: .init(.bottomSheet)
            case .card: .init(.card)
            case .checkbox: .init(.checkbox)
            case .checkboxGroup: .init(.checkbox)
            case .chip: .init(.chip)
            case .circularMeter: .init(.circleMeter)
            case .divider: .init(.divider)
            case .formField: .init(.formField)
            case .fileUpload: .init(.fileUpload)
            case .icon: .init(.icon)
            case .inputOTP: .init(.inputOTP)
            case .microAnimation: .init(.motion)
            case .popover: .init(.popover)
            case .progressBar: .init(.progressBar)
            case .progressBarIndeterminate: .init(.progressBar)
            case .progressTracker: .init(.progressTracker)
            case .radioButton: .init(.radioButton)
            case .radioGroup: .init(.radioButton)
            case .ratingDisplay: .init(.rating)
            case .ratingInput: .init(.rating)
            case .segmentedControl: .init(.segmentedControl)
            case .segmentedGauge: .init(.segmentedGauge)
            case .slider: .init(.slider)
            case .snackbar: .init(.snackbar)
            case .spinner: .init(.spinner)
            case .stepper: .init(.stepper)
            case .tab: .init(.tab)
            case .tag: .init(.tag)
            case .textEditor: .init(.textEditor)
            case .textField: .init(.textField)
            case .textFieldAddons: .init(.textField)
            case .textLink: .init(.textLink)
            case .toggle: .init(.toggle)
            default: nil
            }
        }

        @ViewBuilder
        var illustrationView: some View {
            switch self {
            case .adaptativeStack: AdaptativeStackIllustrationView()
            case .border: BorderIllustrationView()
            case .borderRadius: BorderRadiusIllustrationView()
            case .cornerRadius: CornerRadiusIllustrationView()
            default:
                ZStack {
                    if let illustration {
                        illustration
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image(.placeholder)
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                        Text(self.name.acronym)
                            .font(.system(size: 50))
                            .foregroundStyle(Color.level1)
                            .bold()
                    }
                }
            }
        }

        @ViewBuilder
        var swiftUIComponent: some View {
            switch self {
            case .adaptativeStack: AdaptativeStackComponentView()
            case .avatar: AvatarComponentView()
            case .awarenessCard: AwarenessCardComponentView()
            case .badge: BadgeComponentView()
            case .border: BorderComponentView()
            case .borderRadius: BorderRadiusComponentView()
            case .bottomSheet: BottomSheetComponentView()
            case .button: ButtonComponentView()
            case .card: CardComponentView()
            case .checkbox: CheckboxComponentView()
            case .checkboxGroup: CheckboxGroupComponentView()
            case .chip: ChipComponentView()
            case .circularMeter: CircularMeterComponentView()
            case .cornerRadius: CornerRadiusComponentView()
            case .divider: DividerComponentView()
            case .fileUpload: FileUploadComponentsView()
            case .formField: FormFieldComponentView()
            case .icon: IconComponentView()
            case .inputOTP: InputOTPComponentView()
            case .microAnimation: MicroAnimationComponentView()
            case .popover: PopoverComponentView()
            case .progressBar: ProgressBarComponentView()
            case .progressBarIndeterminate: ProgressBarIndeterminateComponentView()
            case .progressTracker: ProgressTrackerComponentView()
            case .radioButton: RadioButtonComponentView()
            case .radioGroup: RadioGroupComponentView()
            case .ratingDisplay: RatingDisplayComponentView()
            case .ratingInput: RatingInputComponentView()
            case .segmentedControl: SegmentedControlComponentView()
            case .segmentedGauge: SegmentedGaugeComponentView()
            case .slider: SliderComponentView()
            case .snackbar: SnackbarComponentView()
            case .spinner: SpinnerComponentView()
            case .stepper: StepperComponentView()
            case .tab: TabComponentView()
            case .tag: TagComponentView()
            case .textEditor: TextEditorComponentView()
            case .textField: TextFieldComponentView()
            case .textLink: TextLinkComponentView()
            case .toggle: ToggleComponentView()
            default: EmptyView()
            }
        }

        @ViewBuilder
        var uiKitComponent: some View {
            switch self {
            case .adaptativeStack: AdaptativeStackComponentUIViewController()
            case .badge: BadgeComponentUIViewController()
            case .borderRadius: BorderRadiusComponentUIViewController()
            case .button: ButtonComponentUIViewController()
            case .bottomSheet: BottomSheetComponentUIViewController()
            case .card: CardComponentUIViewController()
            case .checkbox: CheckboxComponentUIViewController()
            case .checkboxGroup: CheckboxGroupComponentUIViewController()
            case .chip: ChipComponentUIViewController()
            case .cornerRadius: CornerRadiusComponentUIViewController()
            case .divider: DividerComponentUIViewController()
            case .formField: FormFieldComponentUIViewController()
            case .icon: IconComponentUIViewController()
            case .microAnimation: MicroAnimationComponentUIViewController()
            case .popover: PopoverComponentUIViewController()
            case .progressBar: ProgressBarComponentUIViewController()
            case .progressBarIndeterminate: ProgressBarIndeterminateComponentUIViewController()
            case .progressTracker: ProgressTrackerComponentUIViewController()
            case .radioButton: RadioButtonComponentUIViewController()
            case .radioGroup: RadioGroupComponentUIViewController()
            case .ratingDisplay: RatingDisplayComponentUIViewController()
            case .ratingInput: RatingInputComponentUIViewController()
            case .segmentedGauge: SegmentedGaugeComponentUIViewController()
            case .slider: SliderComponentUIViewController()
            case .snackbar: SnackbarComponentUIViewController()
            case .spinner: SpinnerComponentUIViewController()
            case .stepper: StepperComponentUIViewController()
            case .tab: TabComponentUIViewController()
            case .tag: TagComponentUIViewController()
            case .textEditor: TextEditorComponentUIViewController()
            case .textField: TextFieldComponentUIViewController()
            case .textFieldAddons: TextFieldAddonsComponentUIViewController()
            case .textLink: TextLinkComponentUIViewController()
            case .toggle: ToggleComponentUIViewController()
            default: EmptyView()
            }
        }

        // MARK: - Static Properties

        static func allCases(
            for framework: Framework,
            familly: Familly,
            accessibilityStatus: AccessibilityStatus?
        ) -> [Self] {
            var values: [Self]

            switch framework {
            case .uiKit:
                values = self.allCases.filter {
                    $0 != .avatar &&
                    $0 != .awarenessCard &&
                    $0 != .border &&
                    $0 != .circularMeter &&
                    $0 != .fileUpload &&
                    $0 != .inputOTP &&
                    $0 != .segmentedControl
                }
            case .swiftUI:
                values = self.allCases.filter {
                    $0 != .textFieldAddons
                }
            }

            return values.filter {
                familly == .all || $0.familly == familly
            }
            .filter {
                accessibilityStatus == .all || $0.accessibilityStatus == accessibilityStatus
            }
            .filter {
                accessibilityStatus == .all || $0.accessibilityStatus == accessibilityStatus
            }
        }
    }
}
