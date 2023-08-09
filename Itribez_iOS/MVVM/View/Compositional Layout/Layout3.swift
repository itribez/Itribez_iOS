//
//  Layout3.swift
//  Itribez_iOS
//
//  Created by Admin on 09/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Layout3: View {
    var cards: [Card]
    
    var body: some View {
        HStack(spacing:4){
            HStack(spacing:4){
                
                VStack(spacing:4){
                    
                    AnimatedImage(url: URL(string: cards[safe: 0]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:  (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                    
                    AnimatedImage(url: URL(string: cards[safe:1]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:  (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                }
                VStack(spacing:4){
                    
                    AnimatedImage(url: URL(string: cards[safe: 2]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:   (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                    
                    AnimatedImage(url: URL(string: cards[safe :3]?.downloadURL ?? ""))
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width:  (width / 3), height:  (width / 3))
                        .cornerRadius(4)
                }
            }
            AnimatedImage(url: URL(string: cards[safe:4]?.downloadURL ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: (width / 3), height: (width / 3) * 2)
                .cornerRadius(4)
        }
    }
}


struct Layout3_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
