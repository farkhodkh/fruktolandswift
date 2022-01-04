//
//  BasketViewModel.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 13.12.2021.
//

import SwiftUI
import Alamofire
import CoreData

final class BasketViewModel : ObservableObject {
    @Environment(\.managedObjectContext) private var viewContext
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \GoodItemModel.good_code, ascending: true)],
//        animation: .default)
//    @Published var goodsList: FetchedResults<GoodItemModel>
    
    init() {
        getFromBasket()
    }
    
    func getFromBasket() {
        
    }
}
