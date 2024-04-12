//
//  FetchUserInformationDataSource.swift
//  
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation
import Domain
import Alamofire
import Shared

public class FetchUserInformationDataSource: FetchUserInformationRepositoryProtocol {
    
    let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func fetchUserInformation(userId: String) async throws -> User {
        let path = "users/\(userId)"
        let response: DataResponse<User, AFError> = await apiClient.get(path)
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
