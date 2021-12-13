//
//  GoodsItem.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation

struct GoodsItem : Identifiable, Decodable {
    let id: Int
    let good_name: String
    let good_qtty: Int
    let good_code: Int
    let good_unit: String
    let description: String
    let image_address: String
    let good_price: Int
}
