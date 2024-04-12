//
//  DataSourcesContainer.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Data
import Domain

final class DataSourcesContainer {
    
    class func reloadLoginApiClients() {
        DataSourcesContainer.fetchUserListDataSource = FetchUsersListDataSource(apiClient: APIClientContainer.apiClient)
        DataSourcesContainer.fetchUserInformationDataSource = FetchUserInformationDataSource(apiClient: APIClientContainer.apiClient)
    }
    
    static var fetchUserListDataSource = FetchUsersListDataSource(apiClient: APIClientContainer.apiClient)
    static var fetchUserInformationDataSource = FetchUserInformationDataSource(apiClient: APIClientContainer.apiClient)
}
