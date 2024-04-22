//
//  Memo.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import Foundation
import SwiftData

@Model
final class Memo: Identifiable {
    var id: UUID
    var test: String
    var color: MemoColor
    var created: Date
    
    init(
        id: UUID = UUID(), 
        test: String,
        color: MemoColor,
        created: Date
    ) {
        self.id = id
        self.test = test
        self.color = color
        self.created = created
    }
}

struct MemoColor {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}
