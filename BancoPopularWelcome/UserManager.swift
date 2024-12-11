//
//  UserManager.swift
//  BancoPopularWelcome
//
//  Created by Merianni Nunez Tejeda on 12/11/24.
//

import Foundation

class UserManager: ObservableObject {
    private var users: [String: (fullName: String, password: String)] = [:]
    
    func signUpUser(fullName: String, email: String, password: String, confirmPassword: String) -> String? {
        guard password == confirmPassword else { return "Passwords do not match." }
        users[email] = (fullName, password)
        return nil
    }
    
    func getUsers() -> [String: (fullName: String, password: String)] {
        return users
    }
    
}
