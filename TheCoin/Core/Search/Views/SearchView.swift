//
//  SearchView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-18.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: ContentViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            FilteredCoinsView(viewModel: viewModel)
                .searchable(text: $searchText, prompt: "Search Cryptocurrency")
                .navigationTitle("Search")
                .background(Color.theme.appBGColor)
        }
        .onChange(of: searchText) { newValue in
            viewModel.filterCoins(searchString: newValue)
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
