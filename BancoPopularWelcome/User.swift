//
//  User.swift
//  BancoPopularWelcome
//
//  Created by Merianni Nunez Tejeda on 12/10/24.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
    var fullName: String
    
    init(email: String, password: String, fullName: String) {
        self.email = email
        self.password = password
        self.fullName = fullName
    }
}


