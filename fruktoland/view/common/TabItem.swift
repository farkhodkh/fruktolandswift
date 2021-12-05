//
//  TabItem.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct TubItem : View {
    var isNight: Bool = false
    var itemText: String = "Заголовок"
    var itemType: TabItemEnum
    
    var body: some View {
        
        VStack {
            Image(getImageName(isNight: isNight, itemType: itemType))
                .resizable()
                .frame(width: 25.0, height: 25.0)
//
//            Text(itemText)
//                .foregroundColor(Color.black)
//                .background(Color.white)
//                .font(.system(size: 13, weight: .bold, design: .default))
//                .cornerRadius(10)
            
            
        }
        .padding(5)
    }
}

func getImageName(isNight: Bool, itemType: TabItemEnum) -> String {
    var imageName = ""
    
    switch itemType {
        case TabItemEnum.BASKET: imageName = isNight == true ? "icon-basket-white" : "icon-basket-black"
        case TabItemEnum.SHOP: imageName = isNight == true ? "icon-fruits-white" : "icon-fruits-black"
    }
    
    return imageName
}

struct TubItem_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            TubItem(
                isNight: $0 == .light ? false : true,
                itemText: "Товары",
                itemType: TabItemEnum.BASKET
            )
                .preferredColorScheme($0)
        }
    }
}
