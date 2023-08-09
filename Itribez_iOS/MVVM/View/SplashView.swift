//
//  SplashView.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    var body: some View {
        if self.isActive {
           // TabbarView()
            LoginView()
        } else {
            VStack{
                GeometryReader { gp in
                    ZStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 220)
                            .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                            .position(x: gp.size.width / 2, y: gp.size.height / 2)
                        
                    }
                }
               
            } .background(Colors.theme1.contentDefaultColor)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            
        }
        
        
    }
}

struct SpalshView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
