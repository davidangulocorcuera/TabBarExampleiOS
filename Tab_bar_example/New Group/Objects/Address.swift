//
//  Address.swift
//  Tab_bar_example
//
//  Created by Biolizard on 14/11/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import Foundation
class Address: Codable{
    var street: String
    var suite: String
    var city: String
    var zipcode: String
     var geo: Geo
}
