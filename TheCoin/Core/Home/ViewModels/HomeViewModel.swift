//
//  HomeViewModel.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-14.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    @Published var isLoadingData = true
    var currencyCode: String? = NSLocale.current.currency?.identifier
    
    init() {
        fetchCoinData(sort: 0)
        print(currencyCode ?? "USD")
    }
    
    func fetchCoinData(sort: Int) {
        self.isLoadingData = true
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(currencyCode?.lowercased() ?? "usd")&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let error = error {
                print("DEBUG: Error - \(error.localizedDescription)")
                self.isLoadingData = false
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response Code - \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                    self.configureSortedCoins(sort: sort)
                    self.isLoadingData = false
                }
            } catch let error {
                print("DEBUG: Failed to decode because of Error - \(error)")
                self.isLoadingData = false
            }
        }
        .resume()
    }
    
    func configureSortedCoins(sort: Int) {
        switch(sort) {
        case 1:
            let sortedCoins = coins.sorted(by: { $0.name < $1.name })
            self.coins = sortedCoins
            return
            
        case 2:
            let sortedCoins = coins.sorted(by: { $0.currentPrice > $1.currentPrice })
            self.coins = sortedCoins
            return
            
        case 3:
            let sortedCoins = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
            self.coins = sortedCoins
            return
            
        default:
            let sortedCoins = coins.sorted(by: { $0.marketCapRank < $1.marketCapRank })
            self.coins = sortedCoins
            return
        }
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
