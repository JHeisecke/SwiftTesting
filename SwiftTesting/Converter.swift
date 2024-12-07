//
//  Converter.swift
//  SwiftTesting
//
//  Created by Javier Heisecke on 2024-12-05.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> String {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return String(format:"%.2f", celsius.value)
    }
}
