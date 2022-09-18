//
//  CoinDetailsView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-15.
//

import SwiftUI
import Kingfisher

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //chart
            ChartView(viewModel: viewModel)
                .frame(height: 250)
                .padding(.vertical)
                .shadow(color: viewModel.chartLineColor, radius: 10)
                .shadow(color: viewModel.chartLineColor.opacity(0.7), radius: 10)

            //overview
            CoinDetailsSection(model: viewModel.overviewSectionModel)
                .padding(.vertical)

            //additional details
            CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
                .padding(.vertical)
        }
        .fixFlickering()
        .padding(.horizontal)
        .navigationTitle(viewModel.coinName)
        .background(Color.theme.appBGColor)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Text(viewModel.symbol.uppercased())
                        .font(.headline)
                        .foregroundColor(Color.theme.primaryTextColor)
                    
                    KFImage(URL(string: viewModel.image))
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
