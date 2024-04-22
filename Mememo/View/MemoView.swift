//
//  MemoView.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import SwiftUI
import SwiftData

struct MemoView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var memos: [Memo]
    @State private var isSheetShowing = false
    
    var body: some View {
        NavigationStack {
            List(memos) { memo in
                MemoCell(memo: memo)
            }
            .listStyle(.plain)
            .navigationTitle("Mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Plus") {
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView()
            }
        }
    }
}

#Preview {
    MemoView()
        .modelContainer(previewContainer)
}
