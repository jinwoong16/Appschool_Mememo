//
//  MememoApp.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import SwiftUI

@main
struct MememoApp: App {
    var body: some Scene {
        WindowGroup {
            MemoView()
                .modelContainer(
                    for: Memo.self
                )
        }
    }
}
