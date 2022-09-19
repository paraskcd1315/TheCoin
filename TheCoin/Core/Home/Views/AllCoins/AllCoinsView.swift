//
//  AllCoinsView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-14.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.coins) { coin in
                        
                        NavigationLink {
                            LazyNavigationView(CoinDetailsView(coin: coin))
                        } label: {
                            CoinRowView(coin: coin)
                        }
                        
                        Rectangle()
                            .fill(Color(.systemGray))
                            .frame(height: 0.7)
                            .opacity(0.2)
                    }
                }
            }
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
