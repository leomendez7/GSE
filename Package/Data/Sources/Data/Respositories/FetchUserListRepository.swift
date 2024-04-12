//
//  FetchUserListRepository.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Domain

public class FetchUserListRepository: FetchUsersListRepositoryProtocol {
    
    let dataSource: FetchUserListDataSource
    
    public init(dataSource: FetchUserListDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchUsersList() async throws -> [User] {
        return try await dataSource.fetchUsersList()
    }
    
}
