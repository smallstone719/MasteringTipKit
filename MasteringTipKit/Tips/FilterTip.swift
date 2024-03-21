//
//  FilterTip.swift
//  MasteringTipKit
//
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI
import TipKit

struct FilterTip: Tip {
    static let showFilterTipEvent = Event(id: "showFilterTipEvent")
    
    var title: Text {
        Text("Search and filter with tags.")
    }
    
    var message: Text? {
        Text("Start your text with a word surrounded by brackets like [Work] so you can effectively filter your list.")
    }
    
    var image: Image? {
        Image(systemName: "tag.fill")
    }
    
    var actions: [Action] {
        [
            Action(id: "learn-more", title: "Learn more")
        ]
    }
    
    var rules: [Rule] {
        [
            #Rule(Self.showFilterTipEvent) {
                $0.donations.count >= 4
            }
        ]
    }
}

