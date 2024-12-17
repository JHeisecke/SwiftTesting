//
//  GameTests.swift
//  SwiftTesting
//
//  Created by Javier Heisecke on 2024-12-07.
//

import Testing

@testable import SwiftTesting

struct GameTests {

    @Test func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        #expect(throws: GameError.notPurchased) {
            try game.play()
        }
    }

    @Test func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        #expect(throws: GameError.notInstalled) {
            try game.play()
        }
    }

    @Test func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        #expect(throws: Never.self) {
            try game.play()
        }
    }

    @Test func testPlayingCrashyPlaneThrows() throws {
        let game = Game(name: "CrashyPlane")
        try game.play()
    }

    @Test func testPlayingDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        #expect(throws: GameError.parentalControlsDisallowed) {
            try game.play()
        }
    }

}
