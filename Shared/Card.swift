//
//  Card.swift
//  Flashzilla
//
//  Created by Shane Leigh on 07/07/2020.
//

import Foundation

struct Card {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who is the 44th president of the United States", answer: "Barack Obama")
    }
}
