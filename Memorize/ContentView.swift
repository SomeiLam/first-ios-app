//
//  ContentView.swift
//  Memorize
//
//  Created by Amy Lam on 2/28/24.
//

import SwiftUI

let emojis: [String] = ["👻", "🎃", "😈", "🍭", "💀", "⚡️", "🧙‍♀️"]

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(isFaceUp: true, content: emojis[index])
            }
            
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var isMatched = false
    var content: String
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
            print("tapped")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
