//
//  FetchUserInformationRepositoryProtocol.swift
//
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation

public protocol FetchUserInformationRepositoryProtocol {
    
    func fetchUserInformation(userId: String) async throws -> User
    
}
