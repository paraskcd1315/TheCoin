//
//  CoinDetailsViewModel.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-16.
//

import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin
    
    // Chart Config
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    var coinName: String {
        return coin.name
    }
    
    var symbol: String {
        return coin.symbol
    }
    
    var image: String {
        return coin.image
    }
    
    var chartLineColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0 )
        
        return priceChange > 0 ? .green : .red
    }
    
    var overviewSectionModel: CoinDetailSectionModel {
        // Price stats
        let price = coin.currentPrice.toCurrency()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStats = StatisticModel(title: "Current Price",
                                        value: price,
                                        percentageChange: pricePercentChange)
        
        // Market Cap Stats
        let marketCap = coin.marketCap ?? 0
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization",
                                           value: marketCap.formattedWithAbbreviations(),
                                           percentageChange: marketCapPercentChange)
        
        // Rank Stats
        let rank = coin.marketCapRank
        let rankStat = StatisticModel(title: "Rank",
                                      value: String(rank),
                                      percentageChange: nil)
        
        // Volume Stats
        let volume = coin.totalVolume ?? 0
        let volumeStat = StatisticModel(title: "Volume",
                                        value: "$\(volume.formattedWithAbbreviations())",
                                        percentageChange: nil)
        
        return CoinDetailSectionModel(title: "Overview", stats: [priceStats, marketCapStat, rankStat, volumeStat])
    }
    
    var additionalDetailsSectionModel: CoinDetailSectionModel {
        // 24h High
        let high = coin.high24H?.toCurrency() ?? "N/A"
        let highStat = StatisticModel(title: "24h High",
                                      value: high,
                                      percentageChange: nil)
        
        // 24h Low
        let low = coin.low24H?.toCurrency() ?? "N/A"
        let lowStat = StatisticModel(title: "24h Low",
                                      value: low,
                                      percentageChange: nil)
        
        // 24h Price Change
        let priceChange24H = coin.priceChange24H.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change",
                                             value: priceChange24H,
                                             percentageChange: percentChange24H)
        
        // 24h Market Cap Change
        let markepCapChange = coin.marketCapChange24H ?? 0
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change",
                                                 value: "$\(markepCapChange.formattedWithAbbreviations())",
                                             percentageChange: marketCapChangePercent)
        
        return CoinDetailSectionModel(title: "Additional Details", stats: [highStat, lowStat, priceChangeStat, marketCapChangeStat])
    }
    
    init(coin: Coin) {
        self.coin = coin
        configureChartData()
        
        print("DEBUG: Coin is \(self.coinName)")
    }
    
    func configureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return }
        
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
        self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.yAxisValues = [minPrice, (minPrice + maxPrice) / 2, maxPrice]
        self.xAxisValues = [startDate, endDate]
        
        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            
            let chartDataItem = ChartData(date: date, value: price)
            
            self.chartData.append(chartDataItem)
            index += 1
        }
    }
}
