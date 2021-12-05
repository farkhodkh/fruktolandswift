//
//  GoodItemView.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI

struct GoodItemView : View {
    var id: Int
    var name: String
    var price: Int
    var measureUnit: String
    var imageURLString: String
    var isNight: Bool
    var qtty: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            
            let url = URL(string: imageURLString)!
            
            AsyncImage<Text>(
                imageHolder: "goods",
                url: url,
                placeholder: {
                    Text("Loading ...")
                        .foregroundColor(isNight ? .white : .black)
                }
            )
                .aspectRatio(contentMode: .fill)
            
            Text(name)
                .font(.system(size: 12, weight: .heavy, design: .default))
                .foregroundColor(isNight ? .white : .black)
                .frame(width: 100, height: 30, alignment: .top)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text(String(price) + " руб.")
                .font(.system(size: 14, weight: .heavy, design: .default))
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)

            Text(String("цена за " + measureUnit))
                .font(
                    .system(size: 8, weight: .light, design: .default)
                )
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)
                
            
            HStack {
                Button {
                    print("Button was tapped")
                } label: {
                    Image(isNight ? "icon-plus-white" : "icon-plus-black")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                }
                
                Text(
                    String(qtty)
                )                .font(
                .system(size: 25, weight: .light, design: .default)
                )
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)
                
                Button {
                    print("Button was tapped")
                } label: {
                    Image(isNight ? "icon-minus-white" : "icon-minus-black")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                }
            }
            Divider()
        }
    }
}

struct GoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            GoodItemView(
                id: 98234759,
                name: "Мандарины мароканские высшего качества, свежие",
                price: 250,
                measureUnit: "кг",
                imageURLString: "frukto-land-fruits",
                isNight: $0 == .light ? false : true
            ).preferredColorScheme($0)
        }
    }
}
