//
//  productListViewModel.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

class productListViewModel {
    
    var communicator: productListCommunicator = productListCommunicator()
    var productsList: ProductModel?
    var productData: [Product] = []
    var errorDescription: Error?
    
    var numberOfRowsInSection: Int {
        return productData.count
    }

    func fetchProductList(completion: @escaping (Result<[Product], Error>) -> ()) {
        communicator.getProductList(url: URL(string: GlobalConstant.BaseUrl + GlobalConstant.productListAPI)!) { [weak self] products in
            switch products {
            case .success(let products):
                self?.productData = products
            case .failure(let error):
                self?.errorDescription = error
                print(error)
            }
            completion(products)
        }
    }
}


