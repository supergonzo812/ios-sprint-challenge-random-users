//
//  UserController.swift
//  Random Users
//
//  Created by Chris Gonzales on 3/13/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation


class UserController {
    
    // MARK: - Properties
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    var users: [User] = []
    
    // MARK: - CRUD Methods
    
    func createUser(firstName: String,
                    lastName: String,
                    thumbnail: String,
                    largePhoto: String,
                    phoneNumber: String,
                    emailAddress: String,
                    id: String) {
        
       let newUser = User(firstName: firstName,
                          lastName: lastName,
                          email: emailAddress,
                          phoneNumber: phoneNumber,
                          thumbnail: thumbnail,
                          largePhoto: largePhoto,
                          id: id)
        users.append(newUser)
    }
    
}
