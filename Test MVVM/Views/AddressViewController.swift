//
//  AddressViewController.swift
//  Test MVVM
//
//  Created by Zachary Smith
//  Copyright © 2021 Zachary Smith. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    @IBOutlet weak var labelZip: UILabel!
    @IBOutlet weak var labelState: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelAddress2: UILabel!
    @IBOutlet weak var labelAddress1: UILabel!
    var viewModel: AddressViewControllerViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = viewModel {
            labelAddress1.text = viewModel.address1
            labelAddress2.text = viewModel.address2
            labelCity.text = viewModel.city
            labelState.text = viewModel.state
            labelZip.text = viewModel.zip
        }
    }

}
