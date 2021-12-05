//
//  FruktoLandMainView.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct FruktoLandMainView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        
        TabView {
            HomeItemViewGoods(
                isNight: colorScheme == .light ? false : true
            )
                .tabItem {
                    TubItem(
                        isNight: colorScheme == .light ? false : true,
                        itemText: "Товары",
                        itemType: TabItemEnum.SHOP
                    )
                }
            HomeItemViewBasket(
                isNight: colorScheme == .light ? false : true
            )
                .tabItem {
                    TubItem(
                        isNight: colorScheme == .light ? false : true,
                        itemText: "Корзина",
                        itemType: TabItemEnum.BASKET
                    )
                }
        }
    }
}

struct FruktoLandMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FruktoLandMainView()
        }
    }
}
