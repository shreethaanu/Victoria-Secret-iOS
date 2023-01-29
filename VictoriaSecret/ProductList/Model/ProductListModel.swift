//
//  ProductListModel.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

struct Product: Codable {
    let id: String
    let brand: String
    let name: String
    let productDesc: String
    let price: String
    let offerPrice: String
    let productUrl: String
}

struct ProductData: Codable {
    let products: [Product]
}

struct ProductModel: Codable {
    let data: ProductData
}
