//
//  TopMoversItemView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-14.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        ZStack {
            
            // Shadow
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.itemBGColor)
                    .frame(width: 140, height: 140, alignment: .center)
                    .shadow(color: Color.theme.itemShadowColor, radius: 5, x: 0, y: 7)
                    .opacity(0.2)
            
            // Content
            VStack(alignment: .leading) {
                // Image
                KFImage(URL(string: coin.image))
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.bottom, 8)
                
                // Coin Info
                HStack(spacing: 2) {
                    Text(coin.symbol.uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.primaryTextColor)
                    
                    Text(coin.currentPrice.toCurrency())
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                // Coin Percentage Change
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.title2)
                    .foregroundColor(coin.priceChangePercentage24H < 0 ? .red : .green)
            }
            .frame(width: 140, height: 140)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray4), lineWidth: 1.5)
            )
        }
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
