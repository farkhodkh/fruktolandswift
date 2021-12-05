//
//  GoodsItemDto.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation

struct GoodsItemDto : Decodable {
    var stock_lines : [GoodDto]
}

struct GoodDto : Decodable {
    let good_name: String?
    let good_code: String?
    let good_unit: String?
    let image_address: String?
    let good_price: String?
    let stock_name: String?
    let good_group_name: String?
}
