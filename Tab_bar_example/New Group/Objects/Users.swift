//
//  Users.swift
//  Tab_bar_example
//
//  Created by Biolizard on 14/11/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import Foundation
class Users: Codable{
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}
