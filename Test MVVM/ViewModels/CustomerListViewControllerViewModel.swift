//
//  CustomersViewControllerViewModel.swift
//  Test MVVM
//
//  Created by Zachary Smith
//  Copyright © 2021 Zachary Smith. All rights reserved.
//

import Foundation

class CustomerListViewControllerViewModel {
    private let customers: [Customer]
    
    var customerCount: Int {
        return customers.count
    }
    
    init(customers: [Customer]) {
        self.customers = customers
    }
    
    func customer(atIndex: Int) -> Customer {
        return customers[atIndex]
    }

}
