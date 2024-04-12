//
//  FetchUserListDataSource.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Domain
import Alamofire
import Shared

public class FetchUsersListDataSource: FetchUsersListRepositoryProtocol {
    
    let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func fetchUsersList() async throws -> [User] {
        let path = "users"
        let response: DataResponse<[User], AFError> = await apiClient.get(path)
        let result = response.result
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            print(error.localizedDescription)
            throw error
        }
    }
    
}
