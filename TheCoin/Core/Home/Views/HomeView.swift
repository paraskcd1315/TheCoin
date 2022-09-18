//
//  HomeView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-14.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var sort: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                ZStack {
                    VStack {
                        
                        // Top Movers View
                        TopMoversView(viewModel: viewModel)
                        
                        Divider().padding(.horizontal, 20)
                        
                        // All Coins View
                        AllCoinsView(viewModel: viewModel)
                        
                    }
                    
                    if viewModel.isLoadingData {
                        CustomLoadingIndicator()
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 30, leading: -5, bottom: 0, trailing: -5))
                .navigationTitle("Live Prices")
                .listRowBackground(Color.theme.appBGColor)
                
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .background(Color.theme.appBGColor)
            .refreshable {
                viewModel.fetchCoinData(sort: sort)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Picker(selection: $sort, label: Text("Sorting options")) {
                            Text("Market Cap Rank").tag(0)
                            Text("Name").tag(1)
                            Text("Price").tag(2)
                            Text("Price Change").tag(3)
                        }
                        .onChange(of: sort) { newValue in
                            viewModel.configureSortedCoins(sort: newValue)
                        }
                    }
                    label: {
                        Label("Sort by", systemImage: "arrow.up.arrow.down")
                    }
                }
            }
            
        }
        .accentColor(Color.theme.primaryTextColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
