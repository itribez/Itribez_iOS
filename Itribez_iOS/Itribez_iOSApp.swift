//
//  Itribez_iOSApp.swift
//  Itribez_iOS
//
//  Created by Admin on 09/08/23.
//

import SwiftUI

@main
struct Itribez_iOSApp: App {
   
    @available(iOS 14.0, *)
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            SplashView()
     
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("scene become active")
            case .inactive:
                print("scene become inactive")
            case .background:
                print("scene go background")
            default:
                print("")
            }
        }
    }
}
