//
//  SampleMemoContainer.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import Foundation
import SwiftData

let sampleMemos: [Memo] = [
    .init(text: "one", color: .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1), created: Date()),
    .init(text: "tw0", color: .init(red: 1, green: 0, blue: 0, alpha: 1), created: Date()),
]

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Memo.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        sampleMemos.forEach { container.mainContext.insert($0) }
        
        return container
    } catch {
        fatalError()
    }
}()

