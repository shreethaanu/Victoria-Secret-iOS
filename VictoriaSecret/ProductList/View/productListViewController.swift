//
//  productListViewController.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import UIKit

class productListViewController: UIViewController {

    @IBOutlet weak var productListTable: UITableView!
    var viewModel: productListViewModel = productListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts()
    }

    @IBAction func showUserDetails(_ sender: Any) {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
            self.present(vc, animated: true, completion: nil)
        }
    }

    fileprivate func loadProducts() {
        viewModel.fetchProductList { [weak self] recipesListData in
            switch recipesListData {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.popAlertView(AlertTitle: "Error", AlertDesc: "An unknown error occured while loading the products")
                }
            case .success(_):
                DispatchQueue.main.async {
                    self?.productListTable.reloadData()
                }
            }
        }
    }
    

}

extension productListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productListTableViewCell", for: indexPath) as! productListTableViewCell

        let cellData = self.viewModel.productData[indexPath.row]
        cell.setContent(products: cellData)
        print(cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.product = self.viewModel.productData[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}
