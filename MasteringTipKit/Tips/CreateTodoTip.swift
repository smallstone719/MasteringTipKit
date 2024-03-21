//
//  CreateTodoTip.swift
//  MasteringTipKit
//
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI
import TipKit

struct CreateTodoTip: Tip {
    var title: Text {
        Text("Create your first Todo")
    }
    
    var message: Text? {
        Text("Tap on this button to create your first todo")
    }
    
    var image: Image? {
        Image(systemName: "hand.point.up.fill")
    }
}
