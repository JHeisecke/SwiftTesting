//
//  SieveOfEratosthenesTests.swift
//  SwiftTesting
//
//  Created by Javier Heisecke on 2024-12-20.
//

import Testing

@testable import SwiftTesting

struct PrimeCalculatorTests {
    @Test func testPrimesUpTo100ShouldBe25() async {
        // given
        let maximumCount = 100

        // when
        let primes = await PrimeCalculator.calculate(upTo: maximumCount)

        // then
        #expect(primes.count == 25)
    }

    func testStreamingPrimesUpTo100ShouldBe25() async {
        // given
        let maximumCount = 100
        let expectedCount = 25
        var count = 0
        // when
        await confirmation("Calculate primes up to \(maximumCount)", expectedCount: expectedCount) { primesNumber in
            PrimeCalculator.calculateStreaming(upTo: maximumCount) { _ in
                count += 1
                primesNumber()
            }
            primesNumber.confirm(count: count)
        }
    }

    func testStreamingPrimesUpTo100() async {
        // given
        let maximumCount = 100
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        var counter = 0

        // when
        await confirmation("Calculate primes up to \(maximumCount)") { primeNumbers in
            PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
                // then
                #expect(primes[counter] == number)
                counter += 1
                primeNumbers()
            }
        }
    }

}
