//
//  AdressListViewController.swift
//  Test MVVM
//
//  Created by Veysel Bozkurt on 2.05.2022.
//  Copyright © 2022 Travis Ma. All rights reserved.
//

import UIKit

class AdressListViewController: UIViewController {

    var viewModel: AddressListViewControllerViewModel?
    @IBOutlet weak var addressesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        addressesTableView.register(AddressListCell.nib, forCellReuseIdentifier: AddressListCell.identifier)
        addressesTableView.delegate = self
        addressesTableView.dataSource = self
    }
}



extension AdressListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.addressCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressListCell.identifier, for: indexPath) as? AddressListCell else{ fatalError() }
        if let address = viewModel?.address(atIndex: indexPath.row) {
            cell.setupCell(address: address)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let addressVC = storyboard?.instantiateViewController(withIdentifier: "AddressVCSID") as? AddressViewController {
            if let address = viewModel?.address(atIndex: indexPath.row) {
                addressVC.viewModel = AddressViewControllerViewModel(address: address)
                self.navigationController?.pushViewController(addressVC, animated: true)
            }
        }
    }
    
}
