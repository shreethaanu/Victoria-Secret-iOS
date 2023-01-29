//
//  ProductDetailsViewController.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    var product: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataForDetailsScreen()
    }
    
    func loadDataForDetailsScreen(){
        if let product = product {
            self.productImage.downloaded(from: product.productUrl)
            productName.text =  product.name
            brand.text = "Brand: " + product.brand
            offerPrice.text = "Offer Price: " + product.offerPrice
            price.text = "Price: " + product.price
            productDescription.text = product.productDesc
        }
    }
}
