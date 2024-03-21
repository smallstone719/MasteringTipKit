//
//  CompletionToDeleteTip.swift
//  MasteringTipKit
//
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI
import TipKit

struct CompletionToDeleteTip: Tip {
    @Parameter
    static var reachedThresholdParameter: Bool = false
    
    var title: Text {
        Text("Time to clean up")
    }
    
    var message: Text? {
        Text("Start swiping from the trailing edge to delete completed ToDos")
    }
    
    var image: Image? {
        Image(systemName: "trash")
    }
    
    var rules: [Rule] {
        #Rule(Self.$reachedThresholdParameter) { $0 == true }
    }
}

