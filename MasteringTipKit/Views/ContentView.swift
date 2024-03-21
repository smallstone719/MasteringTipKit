//
//  ContentView.swift
//  MasteringTipKit
//
//  Created by Thach Nguyen Trong on 3/21/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @Environment(\.openURL) private var openUrl
    private let createTodoTip = CreateTodoTip()
    private let swipeActionTip = SwipeActionTip()
    private let completionToDeleteTip = CompletionToDeleteTip()
    private let filterTip = FilterTip()
    
    @State private var addNewView: Bool = false
    @State private var completedCount: Int = 0
    var body: some View {
        NavigationStack {
            
            List {
                TipView(completionToDeleteTip, arrowEdge: .bottom)
                    .tipBackground(.red.opacity(0.15))
                    .tint(.red)
                    .padding(.horizontal, -20)
                    .padding(.top, -12)
                TipView(filterTip, arrowEdge: .bottom) { action in
                    if action.id == "learn-more" {
                        openUrl(URL(string: "https://www.youtube.com")!)
                    }
                }
                .tipBackground(.blue.opacity(0.15))
                .tint(.blue)
                .padding(.horizontal, -20)
                .padding(.top, -12)
                
                TipView(swipeActionTip)
                ForEach(0..<100, id: \.self) { index in
                    Text("Index \(index)")
                        .swipeActions(edge: .leading) {
                            Button {
                                completedCount += 1
                                if completedCount >= 3 {
                                    CompletionToDeleteTip.reachedThresholdParameter = true
                                }
                            } label: {
                                Text("Completion")
                            }
                            .tint(.blue)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Mastering TipKit")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    /// Kiểu này sẽ không hiển thị TipKit
                    /// Button("", systemImage: "") {}
                    Button {
                        addNewView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .popoverTip(createTodoTip, arrowEdge: .top)
                }
            }
            .sheet(isPresented: $addNewView, content: {
                AddNewView(createTodoTip: createTodoTip, swipeActionTip: swipeActionTip)
                    .presentationDetents([.medium])
            })
            .onChange(of: completedCount) { oldValue, newValue in
                if oldValue >= 3 && newValue < 3 {
                    completionToDeleteTip.invalidate(reason: .actionPerformed)
                }
            }
            .task {
                await FilterTip.showFilterTipEvent.donate()
            }
        }
    }
}

#Preview {
    ContentView()
}
