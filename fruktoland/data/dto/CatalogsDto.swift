//
//  CatalogsDto.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation

struct CatalogsDto : Decodable {
    var catalogs : [CatalogDto]
}

struct CatalogDto : Decodable {
    var group_code: String?
    var group_description: String?
    var group_name: String?
    var group_id: String?
    var image_address: String?
    var order: Int?
}
