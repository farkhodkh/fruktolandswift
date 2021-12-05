//
//  CatalogItemsList.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct CatalogItemsList : View {
    var viewModel: HomeItemViewGoodsViewModel
    var catalogTitle: String
    var isNight: Bool = false
    var catalogItems: [GoodsItem] = []
    
    private let columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 8),
        GridItem(.fixed(100), spacing: 8),
        GridItem(.fixed(100), spacing: 8)
    ]
    
    var body: some View {
        ZStack {
            //BackgroundView(isNight: isNight)
            ScrollView {
                LazyVGrid (
                    columns: columns,
                    alignment: .center,
                    spacing: 16,
                    pinnedViews: [.sectionHeaders]
                ) {
                    Section(self.catalogTitle) {
                        ForEach(0..<viewModel.goodsList.count, id: \.self) { index in
                            let item = viewModel.goodsList[index]
                            GoodItemView(
                                id: item.id,
                                name: item.good_name,
                                price: item.good_price,
                                measureUnit: item.good_unit,
                                imageURLString: item.image_address,
                                isNight: isNight,
                                qtty: 0
                            )
                        }
                    }
                }
            }
        }
    }
}

struct CatalogItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CatalogItemsList(
                viewModel: HomeItemViewGoodsViewModel(),
                catalogTitle: "Фрукты",
                isNight: $0 == .light ? false : true,
                catalogItems: [
                    GoodsItem(
                        id: 123,
                        good_name: "Мандарины мароканские высшего качества, свежие",
                        good_qtty: 0,
                        good_code: 324,
                        good_unit: "кг",
                        description: "",
                        image_address: "frukto-land-fruits",
                        good_price: 250
                    ),
                    GoodsItem(
                        id: 345,
                        good_name: "Хурма",
                        good_qtty: 0,
                        good_code: 4567,
                        good_unit: "кг",
                        description: "",
                        image_address: "frukto-land-fruits",
                        good_price: 350
                    ),
                    GoodsItem(
                        id: 786,
                        good_name: "Помидоры",
                        good_qtty: 0,
                        good_code: 4896,
                        good_unit: "кг",
                        description: "",
                        image_address: "frukto-land-fruits",
                        good_price: 550
                    )
                ]
            ).preferredColorScheme($0)
        }
    }
}
