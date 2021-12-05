//
//  CatalogItem.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation
import UIKit

struct CatalogItem : Identifiable, Decodable {
    let id: Int
    let catalog_name: String
    let catalog_description: String
    let catalog_image: String
    let catalog_order: Int
}
