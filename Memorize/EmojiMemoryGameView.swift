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
            self.body(for: geometry.size)
        })
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
           
        }
        .foregroundColor(Color.orange)
        .font(Font.system(size: min(size.width, size.height) * fontScaleFactor))
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}

