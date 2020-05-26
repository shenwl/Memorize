//
//  ContentView.swift
//  Memorize
//
//  Created by shenwl on 2020/5/25.
//  Copyright © 2020 shenwl. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // HStack的content参数直接放在外面
        HStack {
            // 函数第二个参数，被大括号包裹的，可以省略label，甚至可以放在函数外面
            // ForEach(0..<4, content: {...})
            // 把content内容放在外面
            ForEach(0..<4) {
                index in CardView(isFaceUp: false)
            }
        }
        .padding().foregroundColor(Color.orange).font(Font.largeTitle)
    }
}

struct CardView: View {
    // 支持翻转展示
    var isFaceUp: Bool;
    
    var body: some View {
        ZStack {
            if(isFaceUp) {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
           
        }
        
    }
}

