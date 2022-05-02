//
//  AddressListCell.swift
//  Test MVVM
//
//  Created by Veysel Bozkurt on 2.05.2022.
//  Copyright © 2022 Travis Ma. All rights reserved.
//

import UIKit

class AddressListCell: UITableViewCell {

    
    @IBOutlet weak var addressName: UILabel!
    
    
    class var identifier: String {
        return String(describing: self)
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabel()
    }

    func configureLabel() {
        self.addressName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        self.addressName.textColor = .darkText
    }
    
    func setupCell(address: Address) {
        let addressText = address.address1 + " " + address.address2 + " " + address.city + " " + address.state + " " + address.zip
        addressName.text = addressText
    }
    
}
