//
//  AddressListViewControllerViewModel.swift
//  Test MVVM
//
//  Created by Veysel Bozkurt on 2.05.2022.
//  Copyright © 2022 Travis Ma. All rights reserved.
//

import Foundation

class AddressListViewControllerViewModel {
    
    private let addresses: [Address]
    
    var addressCount: Int {
        return addresses.count
    }
    
    func address(atIndex: Int) -> Address {
        return addresses[atIndex]
    }
    
    init(addresses: [Address]) {
        self.addresses = addresses
    }
}
