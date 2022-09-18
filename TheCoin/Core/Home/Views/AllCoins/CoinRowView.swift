//
//  CoinRowView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-14.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        ZStack {
            // Shadow
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.theme.itemBGColor)
                    .frame(height: 64, alignment: .center)
                    .shadow(color: Color.theme.itemShadowColor, radius: 5, x: 0, y: 7)
                    .opacity(0.2)
            
            // Content
            HStack {
                // Market Cap Rank
                Text("\(coin.marketCapRank)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
                // Image
                KFImage(URL(string: coin.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                // Coin Name Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(coin.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                    
                    Text(coin.symbol.uppercased())
                        .font(.caption)
                        .padding(.leading, 6)
                }
                .padding(.leading, 2)
                .foregroundColor(Color.theme.primaryTextColor)
                
                Spacer()
                
                // Coin Price Info
                VStack(alignment: .trailing, spacing: 4) {
                    Text(coin.currentPrice.toCurrency())
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                        .foregroundColor(Color.theme.primaryTextColor)
                    
                    Text(coin.priceChangePercentage24H.toPercentString())
                        .font(.caption)
                        .padding(.leading, 6)
                        .foregroundColor(coin.priceChangePercentage24H < 0 ? .red : .green)
                }
                .padding(.leading, 2)
            }
            .padding(.horizontal)
        }
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
