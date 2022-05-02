//
//  CustomerViewController.swift
//  Test MVVM
//
//  Created by Zachary Smith
//  Copyright © 2021 Zachary Smith. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CustomerListViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(CustomerListViewCell.nib, forCellReuseIdentifier: CustomerListViewCell.identifier)
    }
}

extension CustomerListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.customerCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomerListViewCell.identifier, for: indexPath) as? CustomerListViewCell else {
            fatalError()
        }
        if let customer = viewModel?.customer(atIndex: indexPath.row) {
            cell.setupCell(customer: customer)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let addressVC = storyboard?.instantiateViewController(withIdentifier: "AdressListVCSID") as? AdressListViewController {
            if let addresses = viewModel?.customer(atIndex: indexPath.row).addresses {
                addressVC.viewModel = AddressListViewControllerViewModel(addresses: addresses)
                self.navigationController?.pushViewController(addressVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.height * 0.1
        return height
    }
}

