//
//  productListTableViewCell.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import UIKit

class productListTableViewCell: UITableViewCell {

    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContent(products: Product) {
        self.productImage.downloaded(from: products.productUrl)
        productName.text =  products.name
        brand.text = "Brand: " + products.brand
        offerPrice.text = "Offer Price: " + products.offerPrice
        price.text = "Price: " + products.price
    }
}
