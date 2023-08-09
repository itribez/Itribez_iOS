//
//  NotificationContainerView.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//

import Foundation
import SwiftUI

struct NotificationContainerView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(MockData().activity) {
                    NotificationView(activity: $0)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
                .toolbar(content: {
                    Text("Activity")
                        .font(Font.system(size: 20, weight: .bold))
                        .padding()
                        .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                })
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationContainerView()
    }
}
