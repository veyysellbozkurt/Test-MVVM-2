//
//  CustomerListViewCell.swift
//  Test MVVM
//
//  Created by Veysel Bozkurt on 2.05.2022.
//  Copyright © 2022 Travis Ma. All rights reserved.
//

import UIKit

class CustomerListViewCell: UITableViewCell {

    
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerPrimaryAdress: UILabel!
    
    
    class var identifier: String {
        return String(describing: self)
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabels()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(customer: Customer) {
        let industryName = "(\(customer.industry))"
        self.customerName.text = customer.name + " " + industryName
        
        if isThereAPrimaryAddress(customerAddresses: customer.addresses) {
            let primaryIndex = primaryAddressIndex(customerAddresses: customer.addresses)
            let address = customer.addresses[primaryIndex]
            let addressText = address.address1 + " " + address.address2 + " " + address.city + " " + address.state + " " + address.zip
            self.customerPrimaryAdress.text = addressText
        } else{
            let address = customer.addresses[0]
            let addressText = address.address1 + " " + address.address2 + " " + address.city + " " + address.state + " " + address.zip
            self.customerPrimaryAdress.text = addressText
        }
    }
    
    func isThereAPrimaryAddress(customerAddresses: [Address]) -> Bool {
        var boolSt = false
        for address in customerAddresses {
            if address.isPrimary { boolSt = true }
        }
        return boolSt
    }
    
    func primaryAddressIndex(customerAddresses: [Address]) -> Int {
        for addressIndex in 0...customerAddresses.count {
            if customerAddresses[addressIndex].isPrimary { return addressIndex }
        }
        return 0
    }
    
    
    func configureLabels() {
        customerName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        customerPrimaryAdress.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        customerName.textColor = .darkText
        customerPrimaryAdress.textColor = .darkGray
    }
    
}
