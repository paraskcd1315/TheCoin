//
//  ChartData.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-16.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
