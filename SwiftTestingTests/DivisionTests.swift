//
//  DivisionTests.swift
//  SwiftTesting
//
//  Created by Javier Heisecke on 2024-12-07.
//

import Testing

@testable import SwiftTesting

class DivisionTests {
    var sut: Division!

    init() {
        sut = Division()
    }

    deinit {
        sut = nil
    }

    @Test func testDivisors() {
        // given
        let dividend = 10
        let divisor = 3

        // when
        let result = sut.divisionRemainder(of: dividend, dividedBy: divisor)

        // then
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
    }

    // Gerar Meszaros' verification method
    // Multiple tests can use this verification method, which takes as parameter a sourceLocation
    // sourceLocation's default value is a Swift Compiler directive, thanks to it we'll know which test
    // calling it is failing. https://developer.apple.com/documentation/testing/sourcelocation
    func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, sourceLocation: SourceLocation = #_sourceLocation) {
        #expect(result.quotient == expectedQuotient, sourceLocation: sourceLocation)
        #expect(result.remainder == expectedRemainder, sourceLocation: sourceLocation)
    }
}
