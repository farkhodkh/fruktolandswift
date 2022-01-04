//
//  HomeItemViewGoods.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct HomeItemViewGoods : View {
    var isNight: Bool = false
    @StateObject private var viewModel = GoodsViewModel()
    @State private var isShowingDetailView = false
    @State private var catalogId: Int = 100
    
    func onCatalogTapGesture(catalogId: Int){
        viewModel.getGoodsList(catalogId: catalogId)
        self.isShowingDetailView = true
        self.catalogId = catalogId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                CatalogListView(
                    isNight: isNight,
                    viewModel: viewModel,
                    onTapGesture: onCatalogTapGesture
                )
                    .navigationTitle("Товары")
                    .navigationBarTitleDisplayMode(.inline)
                
                NavigationLink(
                    destination: CatalogItemsList(
                        viewModel: viewModel,
                        catalogTitle: viewModel.getCatalogNameById(id: catalogId),
                        isNight: isNight
                    ),
                    isActive: $isShowingDetailView
                ) {
                    EmptyView()
                }
            }
        }
    }
}

struct HomeItemViewGoods_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HomeItemViewGoods()
                .preferredColorScheme($0)
        }
    }
}
