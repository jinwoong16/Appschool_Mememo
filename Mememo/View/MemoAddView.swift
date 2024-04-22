//
//  MemoAddView.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import SwiftUI
import SwiftData

struct MemoAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var memoText: String = ""
    @State var memoColor: Color = .red
    let colors: [Color] = [.red, .blue, .green]
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") { dismiss() }
                Spacer()
                Button("Done") {
                    // Add memo logic goes here
                    let (red, green, blue, alpha) = UIColor(memoColor).getRGBA()
                    let memo = Memo(
                        text: memoText,
                        color: MemoColor(
                            red: red,
                            green: green,
                            blue: blue,
                            alpha: alpha
                        ),
                        created: Date.now
                    )
                    modelContext.insert(memo)
                    dismiss()
                }
                .disabled(memoText.isEmpty)
            }
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(color)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            Divider()
                .padding()
            TextField("Memo goes here...", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(.white)
                .background(memoColor)
                .shadow(radius: 3)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MemoAddView()
}
