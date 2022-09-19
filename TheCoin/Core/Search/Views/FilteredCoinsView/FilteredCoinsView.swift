//
//  FilteredCoinsView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-18.
//

import SwiftUI

struct FilteredCoinsView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
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
                    ForEach(viewModel.filteredCoins) { coin in
                        
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

//struct FilteredCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredCoinsView()
//    }
//}
