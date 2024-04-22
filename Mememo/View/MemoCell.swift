//
//  MemoCell.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import SwiftUI
import SwiftData

struct MemoCell: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var memo: Memo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(memo.text)")
                    .font(.title)
                Text("\(memo.created.toString)")
                    .font(.body)
                    .padding(.top)
            }
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            Color(
                uiColor: UIColor(
                    red: memo.color.red,
                    green: memo.color.green,
                    blue: memo.color.blue,
                    alpha: memo.color.alpha
                )
            )
        )
        .shadow(radius: 3)
        .contextMenu {
            ShareLink(item: memo.text)
            Button {
                modelContext.delete(memo)
            } label: {
                Image(systemName: "trash.slash")
                Text("Delete")
            }
        }
    }
}
