//
//  StatisticModel.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-15.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}
