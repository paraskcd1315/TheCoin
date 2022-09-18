//
//  StatisticView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-15.
//

import SwiftUI

struct StatisticView: View {
    let model: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            Text(model.title)
                .font(.caption)
            
            Text(model.value)
                .font(.headline)
            
            if let percentChange = model.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                        .scaleEffect(CGSize(width: 1.0, height: percentChange < 0 ? -1.0 : 1.0))
                    
                    
                    Text(percentChange.toPercentString())
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(percentChange > 0  ? .green : .red)
            }
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(model: dev.stat1)
    }
}
