//
//  Division.swift
//  SwiftTesting
//
//  Created by Javier Heisecke on 2024-12-07.
//
import Foundation

struct Division {
    func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
            let quotient = number / dividedBy
            let remainder = number % dividedBy
            return (quotient, remainder)
    }
}
