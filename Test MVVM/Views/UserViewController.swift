//
//  ViewController.swift
//  Test MVVM
//
//  Created by Zachary Smith
//  Copyright © 2021 Zachary Smith. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var labelRole: UILabel!
    @IBOutlet weak var labelName: UILabel!
    var viewModel = UserViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = viewModel.name
        labelRole.text = viewModel.role
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomerListViewController" {
            if let vc = segue.destination as? CustomerListViewController {
                let vm = CustomerListViewControllerViewModel(customers: viewModel.customers)
                vc.modalPresentationStyle = .fullScreen
                vc.viewModel = vm
            }
        }
        if segue.identifier == "AddressViewController" {
            if let vc = segue.destination as? AddressViewController {
                let vm = AddressViewControllerViewModel(address: viewModel.address)
                vc.viewModel = vm
            }
        }
    }

}

