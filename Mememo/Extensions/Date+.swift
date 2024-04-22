//
//  Date+.swift
//  Mememo
//
//  Created by jinwoong Kim on 4/22/24.
//

import Foundation

extension Date {
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
