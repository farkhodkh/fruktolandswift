//
//  CatalogItemView.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct CatalogItemView: View {
    var catalogName: String
    var description: String
    var imageURLString: String
    var catalogId: Int
    var isNight: Bool
    var onTapGesture: (Int) -> ()
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(catalogName)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)
                .lineLimit(catalogName.count < 12 ? 1: 2)
            
            let url = URL(string: imageURLString)!
            
            AsyncImage<Text>(
                imageHolder: "catalog",
                url: url,
                placeholder: {
                    Text("Загрузка ...")
                        .foregroundColor(
                            isNight ? .white : .black
                        )
                    
                }
            )
            
            Text(description)
                .font(.system(size: 10, weight: .medium, design: .default))
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Divider()
        }
        .onTapGesture {
            onTapGesture(catalogId)
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CatalogItemView(
                catalogName: "Фрукты",
                description: "Всегда свежие и вкусные",
                imageURLString: "frukto-land-fruits",
                catalogId: 11111,
                isNight: $0 == .light ? false : true,
                onTapGesture: {_ in}
            ).preferredColorScheme($0)
        }
    }
}
