//
//  String+Extensions.swift
//  WordleSolver
//
//  Created by Tobi Schweiger on 1/25/22.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
