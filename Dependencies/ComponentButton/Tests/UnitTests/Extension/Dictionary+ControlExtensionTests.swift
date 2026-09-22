//
//  Dictionary+ControlExtensionTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 19/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import UIKit
import Testing

@Suite("Dictionary Control Extension Tests")
struct DictionaryControlExtensionTests {

    // MARK: - value(for:)

    @Test("value(for:) returns value for normal state")
    func valueForNormalState() {
        // GIVEN
        let dictionary: [UInt: String] = [UIControl.State.normal.rawValue: "Normal"]

        // WHEN
        let value = dictionary.value(for: .normal)

        // THEN
        #expect(value == "Normal")
    }

    @Test("value(for:) returns value for selected state")
    func valueForSelectedState() {
        // GIVEN
        let dictionary: [UInt: String] = [UIControl.State.selected.rawValue: "Selected"]

        // WHEN
        let value = dictionary.value(for: .selected)

        // THEN
        #expect(value == "Selected")
    }

    @Test("value(for:) returns value for disabled state")
    func valueForDisabledState() {
        // GIVEN
        let dictionary: [UInt: String] = [UIControl.State.disabled.rawValue: "Disabled"]

        // WHEN
        let value = dictionary.value(for: .disabled)

        // THEN
        #expect(value == "Disabled")
    }

    @Test("value(for:) returns value for highlighted state")
    func valueForHighlightedState() {
        // GIVEN
        let dictionary: [UInt: String] = [UIControl.State.highlighted.rawValue: "Highlighted"]

        // WHEN
        let value = dictionary.value(for: .highlighted)

        // THEN
        #expect(value == "Highlighted")
    }

    @Test("value(for:) returns nil when state not present")
    func valueForMissingState() {
        // GIVEN
        let dictionary: [UInt: String] = [UIControl.State.normal.rawValue: "Normal"]

        // WHEN
        let value = dictionary.value(for: .selected)

        // THEN
        #expect(value == nil)
    }

    // MARK: - valueForCurrentState(on:)

    @Test("valueForCurrentState returns highlighted value when control is highlighted")
    func valueForCurrentStateReturnsHighlighted() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.selected.rawValue: "Selected",
            UIControl.State.disabled.rawValue: "Disabled",
            UIControl.State.highlighted.rawValue: "Highlighted"
        ]
        let control = UIControl()
        control.isHighlighted = true

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Highlighted")
    }

    @Test("valueForCurrentState returns disabled value when control is disabled")
    func valueForCurrentStateReturnsDisabled() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.selected.rawValue: "Selected",
            UIControl.State.disabled.rawValue: "Disabled"
        ]
        let control = UIControl()
        control.isEnabled = false

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Disabled")
    }

    @Test("valueForCurrentState returns selected value when control is selected")
    func valueForCurrentStateReturnsSelected() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.selected.rawValue: "Selected"
        ]
        let control = UIControl()
        control.isSelected = true

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Selected")
    }

    @Test("valueForCurrentState returns normal value when control is in normal state")
    func valueForCurrentStateReturnsNormal() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.selected.rawValue: "Selected"
        ]
        let control = UIControl()

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Normal")
    }

    @Test("valueForCurrentState prioritizes highlighted over selected")
    func valueForCurrentStatePrioritizesHighlightedOverSelected() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.disabled.rawValue: "Disabled",
            UIControl.State.highlighted.rawValue: "Highlighted"
        ]
        let control = UIControl()
        control.isSelected = true
        control.isHighlighted = true

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Highlighted")
    }

    @Test("valueForCurrentState prioritizes disabled over selected")
    func valueForCurrentStatePrioritizesDisabledOverSelected() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.disabled.rawValue: "Disabled",
            UIControl.State.selected.rawValue: "Selected"
        ]
        let control = UIControl()
        control.isEnabled = false
        control.isSelected = true

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Disabled")
    }

    @Test("valueForCurrentState prioritizes selected over normal")
    func valueForCurrentStatePrioritizesSelectedOverNormal() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.selected.rawValue: "Selected"
        ]
        let control = UIControl()
        control.isSelected = true

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Selected")
    }

    @Test("valueForCurrentState falls back to normal when no specific state available")
    func valueForCurrentStateFallsBackToNormal() {
        // GIVEN
        let dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal"
        ]
        let control = UIControl()
        control.isSelected = true

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == "Normal")
    }

    @Test("valueForCurrentState returns nil when no states available")
    func valueForCurrentStateReturnsNilWhenEmpty() {
        // GIVEN
        let dictionary: [UInt: String] = [:]
        let control = UIControl()

        // WHEN
        let value = dictionary.valueForCurrentState(on: control)

        // THEN
        #expect(value == nil)
    }

    // MARK: - setValue(_:for:)

    @Test("setValue sets value for normal state and returns true")
    func setValueSetsNormalState() {
        // GIVEN
        var dictionary: [UInt: String] = [:]

        // WHEN
        let result = dictionary.setValue("Normal", for: .normal)

        // THEN
        #expect(result == true)
        #expect(dictionary[UIControl.State.normal.rawValue] == "Normal")
    }

    @Test("setValue sets value for selected state and returns true")
    func setValueSetsSelectedState() {
        // GIVEN
        var dictionary: [UInt: String] = [:]

        // WHEN
        let result = dictionary.setValue("Selected", for: .selected)

        // THEN
        #expect(result == true)
        #expect(dictionary[UIControl.State.selected.rawValue] == "Selected")
    }

    @Test("setValue sets value for disabled state and returns true")
    func setValueSetsDisabledState() {
        // GIVEN
        var dictionary: [UInt: String] = [:]

        // WHEN
        let result = dictionary.setValue("Disabled", for: .disabled)

        // THEN
        #expect(result == true)
        #expect(dictionary[UIControl.State.disabled.rawValue] == "Disabled")
    }

    @Test("setValue sets value for highlighted state and returns true")
    func setValueSetsHighlightedState() {
        // GIVEN
        var dictionary: [UInt: String] = [:]

        // WHEN
        let result = dictionary.setValue("Highlighted", for: .highlighted)

        // THEN
        #expect(result == true)
        #expect(dictionary[UIControl.State.highlighted.rawValue] == "Highlighted")
    }

    @Test("setValue with nil removes value and returns false")
    func setValueWithNilRemovesValue() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.normal.rawValue: "Normal"]

        // WHEN
        let result = dictionary.setValue(nil, for: .normal)

        // THEN
        #expect(result == false)
        #expect(dictionary[UIControl.State.normal.rawValue] == nil)
    }

    @Test("setValue overwrites existing value")
    func setValueOverwritesExisting() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.normal.rawValue: "Old"]

        // WHEN
        let result = dictionary.setValue("New", for: .normal)

        // THEN
        #expect(result == true)
        #expect(dictionary[UIControl.State.normal.rawValue] == "New")
    }

    // MARK: - removeValue(for:)

    @Test("removeValue removes value for normal state")
    func removeValueRemovesNormalState() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.normal.rawValue: "Normal"]

        // WHEN
        dictionary.removeValue(for: .normal)

        // THEN
        #expect(dictionary[UIControl.State.normal.rawValue] == nil)
    }

    @Test("removeValue removes value for selected state")
    func removeValueRemovesSelectedState() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.selected.rawValue: "Selected"]

        // WHEN
        dictionary.removeValue(for: .selected)

        // THEN
        #expect(dictionary[UIControl.State.selected.rawValue] == nil)
    }

    @Test("removeValue removes value for disabled state")
    func removeValueRemovesDisabledState() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.disabled.rawValue: "Disabled"]

        // WHEN
        dictionary.removeValue(for: .disabled)

        // THEN
        #expect(dictionary[UIControl.State.disabled.rawValue] == nil)
    }

    @Test("removeValue removes value for highlighted state")
    func removeValueRemovesHighlightedState() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.highlighted.rawValue: "Highlighted"]

        // WHEN
        dictionary.removeValue(for: .highlighted)

        // THEN
        #expect(dictionary[UIControl.State.highlighted.rawValue] == nil)
    }

    @Test("removeValue does nothing when state not present")
    func removeValueForMissingState() {
        // GIVEN
        var dictionary: [UInt: String] = [UIControl.State.normal.rawValue: "Normal"]

        // WHEN
        dictionary.removeValue(for: .selected)

        // THEN
        #expect(dictionary[UIControl.State.normal.rawValue] == "Normal")
        #expect(dictionary.count == 1)
    }

    @Test("removeValue does not affect other states")
    func removeValueDoesNotAffectOtherStates() {
        // GIVEN
        var dictionary: [UInt: String] = [
            UIControl.State.normal.rawValue: "Normal",
            UIControl.State.selected.rawValue: "Selected",
            UIControl.State.disabled.rawValue: "Disabled"
        ]

        // WHEN
        dictionary.removeValue(for: .selected)

        // THEN
        #expect(dictionary[UIControl.State.normal.rawValue] == "Normal")
        #expect(dictionary[UIControl.State.selected.rawValue] == nil)
        #expect(dictionary[UIControl.State.disabled.rawValue] == "Disabled")
    }
}
