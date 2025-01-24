//
//  Date+DateFormatting.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 27.12.2024.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy" // Format for "Mon, 23 Dec 2024"
        return dateFormatter.string(from: self)
    }
}
