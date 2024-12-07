//
//  ConverterTests.swift
//  SwiftTestingTests
//
//  Created by Javier Heisecke on 2024-12-05.
//

import Testing

@testable import SwiftTesting

/*
 see issue: https://github.com/swiftlang/swift-testing/issues/165
 SwiftTesting, at the time, doesn't have a way to compare floating values accurately
 */
class ConverterTests {

    var sut: Converter!

    // Equivalent to setup()
    // also runs before each test
    init() {
        sut = Converter()
    }

    // Equivalent to tearDown() only accessible to class types
    // also runs after each test
    deinit {
        sut = nil
    }

    // Clear test name to understand the purpose of test if it fails in the future
    @Test func test32FahrenheitIsZeroToCelsius() async throws {
        // given
        let input = 32.0

        // when
        let output = sut.convertToCelsius(fahrenheit: input)

        // then
        #expect((output == "0.00"))
        /// with XCTAssertEquals we have the parameter accuracy, to compare floating points XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }

    // Separated in two different tests to isolate them from influencing in each others result
    @Test func test212FahrenheitIs100ToCelsius() async throws {
        // given
        let input = 212.0

        // when
        let output = sut.convertToCelsius(fahrenheit: input)

        // then
        #expect((output == "100.00"))
        ///with XCTAssertEquals we have the parameter accuracy, to compare floating point XCTAssertEqual(celsius, 100, accuracy: 0.000001)
    }

}
