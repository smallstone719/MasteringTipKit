//
//  SwipeActionTip.swift
//  MasteringTipKit
//
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI
import TipKit

struct SwipeActionTip: Tip {
    static let swipeActionEvent = Event(id: "swipeActionEvent")
    
    var options: [TipOption] {
        Tips.MaxDisplayCount(1)
    }
    
    var title: Text {
        Text("Swipe Actions")
    }
    
    var message: Text? {
        Text("Swipe from leading edge to mark as completed\nSwipe from trailing edge to delete.")
    }
    
    var image: Image? {
        Image(systemName: "info.bubble.fill.rtl")
    }
    
    var rules: [Rule] {
        [
            #Rule(Self.swipeActionEvent) { event in
                event.donations.count >= 3
            }
        ]
    }
}

