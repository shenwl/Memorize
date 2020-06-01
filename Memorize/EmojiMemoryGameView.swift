//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by shenwl on 2020/5/25.
//  Copyright © 2020 shenwl. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        // HStack的content参数直接放在外面
        HStack {
            // 函数第二个参数，被大括号包裹的，可以Å省略label，甚至可以放在函数外面
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: { self.viewModel.choose(card: card) })
            }
        }
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
               
            }
            .foregroundColor(Color.orange)
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
        })
    }
}

