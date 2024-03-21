//
//  AddNewView.swift
//  MasteringTipKit
//
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI

struct AddNewView: View {
    @Environment(\.dismiss) var dismiss
    let createTodoTip: CreateTodoTip
    let swipeActionTip: SwipeActionTip
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    /// TipKit phải xác nhận kết thúc hoặc phải Close Popup
                    /// thì nó sẽ không còn hiển thị
                    createTodoTip.invalidate(reason: .actionPerformed)
                    Task {
                        /// 
                        await SwipeActionTip.swipeActionEvent.donate()
                    }
                    
                    dismiss()
                } label: {
                    Text("Save")
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .buttonStyle(.bordered)
            }
            .navigationTitle("Add New")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewView(createTodoTip: CreateTodoTip(), swipeActionTip: SwipeActionTip())
}
