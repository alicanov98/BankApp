//
//  SiteView.swift
//  BankApp
//
//  Created by Malik Alijanov on 06.05.25.
//

import SwiftUI

struct SiteView: Identifiable {
    var id = UUID().uuidString
    var month: Date
    var views: Double
    var animate: Bool = false
}

extension Date {
    func updateMonth(value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(from: DateComponents(
            year: calendar.component(.year, from: self),
            month: value,
            day: 1 
        )) ?? .now
    }
}

var sample_analystic: [SiteView] = [
    SiteView(month: Date().updateMonth(value: 1), views: 950),
    SiteView(month: Date().updateMonth(value: 2), views: 1120),
    SiteView(month: Date().updateMonth(value: 3), views: 870),
    SiteView(month: Date().updateMonth(value: 4), views: 1250),
    SiteView(month: Date().updateMonth(value: 5), views: 1100),
    SiteView(month: Date().updateMonth(value: 6), views: 1400),
    SiteView(month: Date().updateMonth(value: 7), views: 1300),
    SiteView(month: Date().updateMonth(value: 8), views: 1650),
    SiteView(month: Date().updateMonth(value: 9), views: 1550),
    SiteView(month: Date().updateMonth(value: 10), views: 1800),
    SiteView(month: Date().updateMonth(value: 11), views: 1720),
    SiteView(month: Date().updateMonth(value: 12), views: 1950)
]


