//
//  FetchUserInformationRepository.swift
//
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation
import Domain

public class FetchUserInformationRepository: FetchUserInformationRepositoryProtocol {
        
    let datasource: FetchUserInformationDataSource
    
    public init(datasource: FetchUserInformationDataSource) {
        self.datasource = datasource
    }
    
    public func fetchUserInformation(userId: String) async throws -> User {
        return try await datasource.fetchUserInformation(userId: userId)
    }
    
}
