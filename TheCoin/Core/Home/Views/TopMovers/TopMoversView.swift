//
//  TopMoversView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-14.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 14) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            LazyNavigationView(CoinDetailsView(coin: coin))
                        } label: {
                            TopMoversItemView(coin: coin)
                        }
                        
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal)
            }
        }
        
    }
}

//
//struct TopMoversView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversView()
//    }
//}
