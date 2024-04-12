//
//  FetchUserInformationUseCase.swift
//
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation

public class FetchUserInformationUseCase: UseCaseProtocol {
    
    let repository: FetchUserInformationRepositoryProtocol
    
    public init(repository: FetchUserInformationRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(requestValue: String) async throws -> User {
        return try await repository.fetchUserInformation(userId: requestValue)
    }
    
}
