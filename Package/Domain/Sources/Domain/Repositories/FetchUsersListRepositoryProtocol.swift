//
//  FetchUsersListRepositoryProtocol.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation

public protocol FetchUsersListRepositoryProtocol {
    
    func fetchUsersList() async throws -> [User]
    
}
