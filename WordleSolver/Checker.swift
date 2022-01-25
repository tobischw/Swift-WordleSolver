//
//  Checker.swift
//  WordleSolver
//
//  Created by Tobi Schweiger on 1/25/22.
//

import Foundation

enum LetterStatus {
    case matching
    case wrongPosition
    case notFound
    
    var description: String {
        switch self {
        case .matching:
            return "🟩"
        case .wrongPosition:
            return "🟨"
        case .notFound:
            return "⬜️"
        }
    }
}

struct Result {
    let letters: String
    let status: [LetterStatus]
    
    var allMatched: Bool {
        !status.isEmpty && status.allSatisfy { $0 == .matching }
    }
    
    func printOut() {
        let string = letters.reduce(into: "") { result, letter in
            result += "\(letter)"
        }
        print("\n-- \"\(string)\"")
        print(status.map { $0.description }.joined())
    }
}

struct Checker {
    let answer: String
    
    init(answer: String) {
        self.answer = answer
    }
    
    func check(_ word: String) -> Result {
        let status: [LetterStatus] = answer.enumerated().map { (index, letter) in
            let otherLetter = word[index]
            
            if letter == otherLetter {
                return .matching
            }
            
            if answer.contains(otherLetter) {
                return .wrongPosition
            }
            
            return .notFound
        }
        
        return Result(letters: word, status: status)
    }
}
