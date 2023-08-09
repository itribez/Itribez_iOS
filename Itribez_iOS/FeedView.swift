//
//  FeedView.swift
//  Itribez_iOS
//
//  Created by Admin on 30/08/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isToast = false
    var body: some View {
        VStack{
            HStack(spacing: 10){
                
                Image(uiImage: UIImage.init(named: "ItribezHeaderLogo")!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 180, height: 46, alignment: .leading)
                    .foregroundColor(.primary)
                
                
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image("add")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .aspectRatio( contentMode: .fit)
                        .foregroundColor(.primary)
                    
                }
                Button(action: {}) {
                    Image("Chat")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .aspectRatio( contentMode: .fit)
                        .foregroundColor(.primary)
                    
                }
                
                
            }.padding([.horizontal,.top])
            
            List(){
                Section() {
                    ForEach(viewModel.feedlist ?? []) { feed in
                        
                        PostCell(post: feed, likedcallback: { status in
                            isToast = true
                        })
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }
                
            }.background(Colors.theme1.contentDefaultColor)
                .frame(width: UIScreen.main.bounds.width)
                .listStyle(PlainListStyle())
        }.background(Colors.theme1.contentDefaultColor)
            .overlay(overlayView: Banner.init(data: Banner.BannerDataModel(title: "Instagram post", detail: "You have clicked on Liked", type: .info), show: $isToast)
                     , show: $isToast)
        
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
