//
//  main.swift
//  WordleSolver
//
//  Created by Tobi Schweiger on 1/25/22.
//

import ArgumentParser

struct WordleSolver: ParsableCommand {
    @Argument(help: "The list of 5 letter words to reference.")
    var wordFile: String
    
    func run() throws {
        let dictionary = WordDictionary(loadFrom: wordFile)!
        
        let answer = dictionary.randomWord()
        print("Answer: \(answer)")
        print("===========================")
        
        let checker = Checker(answer: answer)
        let solver = Solver(checker: checker, dictionary: dictionary)
        
        let (attempts, rules) = solver.solve()
        print("\n\nAttempts:", attempts)
        print("Rules:", rules, "\n")
    }
}

WordleSolver.main()
