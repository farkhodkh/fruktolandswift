//
//  HomeItemViewBasket.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI
import CoreData

struct HomeItemViewBasket : View {
    var isNight: Bool = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \GoodItemModel.good_code, ascending: true)],
        animation: .default)
    var goodsList: FetchedResults<GoodItemModel>
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(goodsList) { itemModel in
//                        GoodItemView(
//                            item: itemModel.toGoodItem(),
//                            isNight: false
//                        )
//                        NavigationLink {
//                            Text(item.good_name ?? "")
//                        } label: {
//                            Text(String(item.good_price))
//                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            }
        }
    }
    
    func deleteItem(offsets: IndexSet) {
        
    }
}

struct HomeItemViewBasket_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemViewBasket()
    }
}
