//
//  communicator.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

class productListCommunicator {

    func getProductList(url: URL, completion: @escaping (Result<[Product], Error>) -> ()) {
        webServiceManager.shared.makeServiceCall(url: url) { (json: ProductModel?) in
            if let productList = json {
                completion(.success(productList.data.products))
            }
        } failure: { error in
            if let error = error {
                completion(.failure(error))
            }
        }
    }
}
