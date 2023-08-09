//
//  MessageContainerView.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//

import SwiftUI

struct MessagesContainerView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            Text("Hello, Messages!")
            .navigationBarTitle("", displayMode: .inline)
                .toolbar(content: {
                   
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Indu Pandey")
                            .font(Font.system(size: 20, weight: .bold))
                            .padding()
                            .frame(width: UIScreen.main.bounds.size.width / 2, alignment: .leading)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Image(systemName: "video")
                                .resizable()
                                .scaledToFit()
                                .font(.system(size: 20))
                                .padding(.trailing, 10)
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .scaledToFit()
                                .font(.system(size: 20))
                        }
                    }
                })
        }
        .navigationBarHidden(false)
    }
}

struct MessagesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesContainerView()
    }
}
