//
//  Question.swift
//  QuizApp
//
//  Created by Lingfang He on 2024-02-09.
//

import Foundation

struct Question{
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}


