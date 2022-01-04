//
//  CatalogListView.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct CatalogListView : View {
    var isNight: Bool = false
    var viewModel: GoodsViewModel
    var onTapGesture: (Int) -> ()
    
    private let columns: [GridItem] = [
        GridItem(.fixed(150), spacing: 8),
        GridItem(.fixed(150), spacing: 8)
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
                    Section() {
                        ForEach(0..<viewModel.catalogsList.count, id: \.self) { index in
                            let item = viewModel.catalogsList[index]
                            CatalogItemView(
                                catalogName: item.catalog_name,
                                description: item.catalog_description,
                                imageURLString: item.catalog_image,
                                catalogId: item.id,
                                isNight: isNight,
                                onTapGesture: onTapGesture
                            )
                        }
                    }
                    .padding()
                }
                Divider().opacity(0)
            }
            Spacer()
        }
    }
}

struct CatalogListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CatalogListView(
                isNight: $0 == .light ? false : true,
                viewModel: GoodsViewModel(),
                onTapGesture: {_ in}
            ).preferredColorScheme($0)
        }
    }
}
