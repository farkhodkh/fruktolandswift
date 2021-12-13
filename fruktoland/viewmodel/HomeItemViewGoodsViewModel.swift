//
//  HomeItemViewGoodsViewModel.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//


import SwiftUI
import Alamofire

final class HomeItemViewGoodsViewModel : ObservableObject {
    @Published var goodsList: [GoodsItem] = []
    @Published var catalogsList: [CatalogItem] = []
    @Published var isLoading = false
    
    init() {
        //getCatalogList()
        getCatalogs()
    }
    
    func getGoodsList(catalogId: Int) {
        isLoading = true
        self.goodsList.removeAll()
        
        let urlString = Constants.BASE_URL + "/frukto-land/hs/exchange/fl/" + Constants.VERSION + "/getstock/?catalogId=" + String(catalogId)
        
        let headers: HTTPHeaders = ["Authorization": "Basic " + Constants.TOKEN]
        
        AF
            .request(
                urlString,
                method: .get,
                parameters: nil,
                encoding: URLEncoding.default,
                headers: headers
            )
            .response { response in
                
                guard let responseData = response.data else {return}
                
                do {
                    let goodsDtoList = try JSONDecoder().decode(GoodsItemDto.self, from: responseData)
                    for goodDto in goodsDtoList.stock_lines.sorted{ $0.good_name ?? "" > $1.good_name ?? ""} {
                        
                        let fullURL = Constants.BASE_URL + "/" + (goodDto.image_address ?? "")
                        self.goodsList.insert(
                            GoodsItem(
                                id: Int(goodDto.good_code ?? "0")!,
                                good_name: goodDto.good_name ?? "",
                                good_qtty: 0,
                                good_code: Int(goodDto.good_code ?? "0")!,
                                good_unit: goodDto.good_unit ?? "кг",
                                description: goodDto.good_group_name ?? "",
                                image_address:  fullURL,
                                good_price: Int(goodDto.good_price ?? "0")!
                            ),
                            at: 0
                        )
                    }
                } catch let error {
                    print(error)
                    self.isLoading = false
                }
            }
    }
    
    func getCatalogs() {
        self.isLoading = true
        self.catalogsList.removeAll()
        
        let urlString = Constants.BASE_URL + "/frukto-land/hs/exchange/fl/" + Constants.VERSION + "/getcatalog/"
        
        let headers: HTTPHeaders = ["Authorization": "Basic " + Constants.TOKEN]
        
        AF
            .request(
                urlString,
                method: .get,
                parameters: nil,
                encoding: URLEncoding.default,
                headers: headers
            )
            .response { response in
                guard let responseData = response.data else {return}
                do {
                    let catalogsDtoList = try JSONDecoder().decode(CatalogsDto.self, from: responseData)
                    
                    for catalogDto in catalogsDtoList.catalogs.sorted(by: { ($0.order ?? 0) > ($1.order ?? 0)}) {
                        
                        let fullURL = Constants.BASE_URL + "/" + (catalogDto.image_address ?? "")
                        
                        self.catalogsList.insert(
                            CatalogItem(
                                id: Int(catalogDto.group_code ?? "0")!,
                                catalog_name: catalogDto.group_name ?? "",
                                catalog_description: catalogDto.group_description ?? "",
                                catalog_image: fullURL,
                                catalog_order: catalogDto.order ?? 0
                            ),
                            at: 0
                        )
                    }
                    self.isLoading = false
                } catch let error {
                    print(error)
                    self.isLoading = false
                }
            }
    }
    //
    //    func getCatalogList() {
    //        self.catalogsList = [
    //            CatalogItem(id: 0, catalog_name: "Фрукты", catalog_image: "frukto-land-fruits", catalog_order: 0),
    //            CatalogItem(id: 1, catalog_name: "Ягоды", catalog_image: "frukto-land-trawberry-outline", catalog_order: 1),
    //            CatalogItem(id: 2, catalog_name: "Овощи", catalog_image: "rukto-land-carrot-outline", catalog_order: 1),
    //            CatalogItem(id: 3, catalog_name: "Овощи 1", catalog_image: "rukto-land-carrot-outline", catalog_order: 1),
    //            CatalogItem(id: 4, catalog_name: "Овощи 2", catalog_image: "rukto-land-carrot-outline", catalog_order: 1),
    //            CatalogItem(id: 5, catalog_name: "Овощи 3", catalog_image: "rukto-land-carrot-outline", catalog_order: 1),
    //            CatalogItem(id: 6, catalog_name: "Овощи 4", catalog_image: "rukto-land-carrot-outline", catalog_order: 1),
    //        ]
    //    }
    
    func getCatalogNameById(id: Int) -> String {
        return catalogsList.first { catalogItem in
            catalogItem.id == id
        }?.catalog_name ??  "Наименование каталога"
    }
}
