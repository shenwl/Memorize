//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by shenwl on 2020/5/26.
//  Copyright © 2020 shenwl. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🤐", "😈", "🤧", "😷", "🤒", "🤡", "👾", "😽", "🙀", "👩", "👨🏻‍🦱", "👮🏻‍♀️", "🕵🏻‍♀️"]

        return MemoryGame<String>(numberOfPairsOfCards: 2){ pairIndex in emojis[pairIndex]}
    }
    
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
