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
    var text: String
    var color: MemoColor
    var created: Date
    
    init(
        id: UUID = UUID(), 
        text: String,
        color: MemoColor,
        created: Date
    ) {
        self.id = id
        self.text = text
        self.color = color
        self.created = created
    }
}

struct MemoColor: Codable {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}
