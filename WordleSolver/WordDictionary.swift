//
//  Words.swift
//  WordleSolver
//
//  Created by Tobi Schweiger on 1/25/22.
//

import Foundation

enum Rule: Hashable {
    case match(position: Int, letter: Character)
    case notMatch(position: Int, letter: Character)
    case contain(letter: Character)
    case notContain(letter: Character)
    
    var humanDescription: String {
        switch self {
            case .match(let position, let letter):
                return "🟩 Matched \"\(letter)\" on #\(position + 1)."
            case .notMatch(let position, let letter):
                return "🟨 \"\(letter)\" will never appear on #\(position + 1)."
            case .contain(let letter):
                return "🟨 Contains \"\(letter)\" somewhere"
            case .notContain(let letter):
                return "⬜️ Does NOT contain \"\(letter)\" anywhere"
        }
    }
}

struct WordDictionary {
    var words = [String]()
    
    init?(loadFrom path: String) {
        guard let words = try? loadFromFile(path: path) else { return nil }
        self.words = words
    }
    
    func randomWord() -> String {
        words.randomElement() ?? ""
    }
    
    func find(rules: [Rule]) -> String? {
        words.first(where: { word in
            matchRule(word: word, rules: rules)
        })
    }
    
    private func matchRule(word: String, rules: [Rule]) -> Bool {
        rules.allSatisfy { rule in
            switch rule {
                case .match(let position, let letter):
                    return word[position] == letter
                case .notMatch(let position, let letter):
                    return word[position] != letter
                case .contain(let letter):
                    return word.contains(letter)
                case .notContain(let letter):
                    return !word.contains(letter)
            }
        }
    }
}

private extension WordDictionary {
    func loadFromFile(path: String) throws -> [String] {
        let content = try String(contentsOfFile: path, encoding: .utf8)
        return content.components(separatedBy: "\n").map { $0.uppercased() }
    }
}
