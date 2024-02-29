//
//  ContentView.swift
//  Memorize
//
//  Created by Amy Lam on 2/28/24.
//

import SwiftUI

let emojis: [String] = ["👻", "🎃", "😈", "🍭", "💀", "🕷️", "🧙‍♀️", "🕸️", "🙀", "☠️", "👹"]

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(emojis.indices, id: \.self) { index in
                    CardView(isFaceUp: true, content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(.orange)
            .padding()
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var isMatched = false
    var content: String
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
