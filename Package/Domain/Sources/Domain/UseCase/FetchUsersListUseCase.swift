//
//  FetchUsersListUseCase.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation

public class FetchUsersListUseCase: UseCaseProtocol {
    
    let repository: FetchUsersListRepositoryProtocol
    
    public init(repository: FetchUsersListRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(requestValue: String) async throws -> [User] {
        return try await repository.fetchUsersList()
    }
    
}
