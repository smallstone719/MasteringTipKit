//
//  MasteringTipKitApp.swift
//  MasteringTipKit
//  https://youtu.be/jcn6tdofUVk?si=jG-vkOXw_LpdZEdI
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI
import TipKit

@main
struct MasteringTipKitApp: App {
    
    init() {
        /// Purge all TipKit related data
        /// try? Tips.resetDatastore()
        
        /// Show somw tips but not all
        /// Tips.showTipsForTesting([CompletionToDeleteTip.self])
        
        /// Hie some but not all
        /// Tips.hideTipsForTesting([CreateTodoTip.self])

        /// Show all tip defined in the app
        /// Tips.showAllTipsForTesting()
        
        /// Hide all tip defined in the app
        /// Tips.hideAllTipsForTesting()
        try? Tips.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}
