//
//  Solver.swift
//  WordleSolver
//
//  Created by Tobi Schweiger on 1/25/22.
//

import Foundation

struct Solver {
    
    let checker: Checker
    let dictionary: WordDictionary
    
    init(checker: Checker, dictionary: WordDictionary) {
        self.checker = checker
        self.dictionary = dictionary
    }
    
    func solve() -> (attempts: Int, rules: Int) {
        var word = dictionary.randomWord()
        var lastAttempt: Result = Result(letters: "", status: [])
        
        var allRules: Set<Rule> = []
        var attempts = 0
        
        while !lastAttempt.allMatched {
            attempts += 1
            lastAttempt = checker.check(word)
            lastAttempt.printOut()
            
            let rules = generateRules(from: lastAttempt)
            allRules = allRules.union(rules)
            
            allRules.sorted(by: { ruleA, ruleB in
                ruleA.humanDescription > ruleB.humanDescription
            }).forEach { print("  → \($0.humanDescription)") }
            
            word = dictionary.find(rules: allRules.map { $0 }) ?? "NOTFOUND"
        }
        
        let numberRules = allRules.count
        
        return (attempts, numberRules)
    }
    
    private func generateRules(from result: Result) -> [Rule] {
        let matches: [Rule] = result.status.enumerated().reduce(into: []) { (previous, enumerated) in
            let status = enumerated.element
            switch status {
                case .matching:
                    previous.append(.match(position: enumerated.offset, letter: result.letters[enumerated.offset]))
                case .wrongPosition:
                    previous.append(.notMatch(position: enumerated.offset, letter: result.letters[enumerated.offset]))
                    previous.append(.contain(letter: result.letters[enumerated.offset]))
                case .notFound:
                    previous.append(.notContain(letter: result.letters[enumerated.offset]))
                    break
            }
        }
        
        return matches
    }
    
}
