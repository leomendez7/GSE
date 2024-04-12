//
//  FetchUserListRepository.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Domain

public class FetchUserListRepository: FetchUsersListRepositoryProtocol {
    
    let datasource: FetchUserListDataSource
    
    public init(datasource: FetchUserListDataSource) {
        self.datasource = datasource
    }
    
    public func fetchUsersList() async throws -> [User] {
        return try await datasource.fetchUsersList()
    }
    
}
