//
//  SampleMemoContainer.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import Foundation
import SwiftData

let sampleMemos: [Memo] = [
    .init(text: "one", color: .init(red: 120, green: 120, blue: 120, alpha: 1), created: Date())
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

