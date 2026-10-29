//
//  SparkAnimationRepeat.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkCommon

@Suite("Spark Animation Repeat Tests")
struct SparkAnimationRepeatTests {

    @Test("None repeat")
    func noneRepeat() {
        let animation = SparkAnimationRepeat.none
        #expect(!(animation.canContinue(counter: 0)), "canContinue should be false when there is no repeat and the counter is equals to 0")
        #expect(!(animation.canContinue(counter: 1)), "canContinue should be false when there is no repeat and the counter is equals to 1")
    }

    @Test("Limited repeat")
    func limitedRepeat() {
        let animation = SparkAnimationRepeat.limited(3)
        #expect(animation.canContinue(counter: 0), "canContinue should be true when there is a limited repeat and the counter is equals to 0")
        #expect(animation.canContinue(counter: 1), "canContinue should be true when there is a limited repeat and the counter is equals to 1")
        #expect(animation.canContinue(counter: 2), "canContinue should be true when there is a limited repeat and the counter is equals to 2")
        #expect(!(animation.canContinue(counter: 3)), "canContinue should be false when there is a limited repeat and the counter is equals to 3")
        #expect(!(animation.canContinue(counter: 4)), "canContinue should be false when there is a limited repeat and the counter is equals to 4")
    }

    @Test("Unlimited repeat")
    func unlimitedRepeat() {
        let animation = SparkAnimationRepeat.unlimited
        #expect(animation.canContinue(counter: 0), "canContinue should be true when there is an unlimited repeat and the counter is equals to 0")
        #expect(animation.canContinue(counter: 100), "canContinue should be true when there is an unlimited repeat and the counter is equals to 100")
        #expect(animation.canContinue(counter: 1000), "canContinue should be true when there is an unlimited repeat and the counter is equals to 1000")
    }
}
