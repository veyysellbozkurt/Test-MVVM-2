//
//  File.swift
//  Test MVVM
//
//  Created by Zachary Smith
//  Copyright © 2021 Zachary Smith. All rights reserved.
//

import Foundation

struct User {
    var name = ""
    var role = ""
    var address: Address?
    var customers = [Customer]()
}
