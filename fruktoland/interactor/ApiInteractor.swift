//
//  ApiInteractor.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation
import SwiftUI

final class ApiInteractor : ObservableObject {
    @Published var catalogDtoList : [CatalogDto] = []
    
    init() {
        getCatalogs()
    }
    
    func getCatalogs() {
        let urlString = Constants.BASE_URL + "/frukto-land/hs/exchange/fl/" + Constants.VERSION + "/getcatalog/"
        guard let url = URL(string: urlString) else { return }
        
        //let publisher = URLSession.shared.dataTaskPublisher(for: url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic " + Constants.TOKEN, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession
            .shared
            .dataTask(with: request) { data, response, error in
                
//                print(String(decoding: data!, as: UTF8.self))
//                print(response)
//                print(error)
                
                guard let responseData = data else {return}
                
                do {
                    let catalogsDtoList = try JSONDecoder().decode(CatalogsDto.self, from: responseData)
                    self.catalogDtoList = catalogsDtoList.catalogs
                } catch let error {
                    print(error)
                }
            }
        
        task.resume()
    }
}

