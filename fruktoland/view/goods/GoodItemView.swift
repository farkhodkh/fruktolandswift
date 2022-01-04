//
//  GoodItemView.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import SwiftUI
import CoreData

struct GoodItemView : View {
    var item: GoodsItem
    var isNight: Bool
    @State private var qtty: Int = 0
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack(alignment: .center) {
            
            let url = URL(string: item.image_address)!
            
            AsyncImage<Text>(
                imageHolder: "goods",
                url: url,
                placeholder: {
                    Text("Loading ...")
                        .foregroundColor(isNight ? .white : .black)
                }
            )
                .aspectRatio(contentMode: .fill)
            
            Text(item.good_name)
                .font(.system(size: 12, weight: .heavy, design: .default))
                .foregroundColor(isNight ? .white : .black)
                .frame(width: 100, height: 30, alignment: .top)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text(String(item.good_price) + " руб.")
                .font(.system(size: 14, weight: .heavy, design: .default))
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)

            Text(String("цена за " + item.good_unit))
                .font(
                    .system(size: 8, weight: .light, design: .default)
                )
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)
                
            
            HStack {
                Button {
                    self.qtty = self.qtty + 1
                    saveItem()
                } label: {
                    Image(isNight ? "icon-plus-white" : "icon-plus-black")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                }
                
                Text(
                    String(self.qtty)
                )                .font(
                .system(size: 25, weight: .light, design: .default)
                )
                .foregroundColor(isNight ? .white : .black)
                .multilineTextAlignment(.center)
                
                Button {
                    self.qtty = (self.qtty - 1) <= 0 ? 0 : self.qtty - 1
                    saveItem()
                } label: {
                    Image(isNight ? "icon-minus-white" : "icon-minus-black")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                }
            }
            Divider()
        }
    }
    
    func saveItem() {
        withAnimation {
            let modelItem = GoodItemModel(context: viewContext)
            
            modelItem.good_name = item.good_name
            modelItem.good_code = Int64(item.good_code)
            modelItem.good_price = Int64(item.good_price)
            modelItem.good_qtty = Int64(self.qtty)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}



struct GoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            GoodItemView(
                item: GoodsItem(
                    id: 98234759,
                    good_name: "Мандарины мароканские высшего качества, свежие",
                    good_qtty: 100,
                    good_code: 2323,
                    good_unit: "кг",
                    description: "",
                    image_address: "frukto-land-fruits",
                    good_price: 250),
                isNight: $0 == .light ? false : true
            ).preferredColorScheme($0)
        }
    }
}
