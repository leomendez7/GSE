//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Domain

public protocol UserListFactory {
    
    func usersListViewController() -> UsersListViewController
    func userDetailsViewController() -> UserDetailsViewController
    
}
