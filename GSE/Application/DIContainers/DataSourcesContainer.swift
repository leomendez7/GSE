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
        DataSourcesContainer.fetchUserListDataSource = FetchUserListDataSource(apiClient: APIClientContainer.apiClient)
    }
    
    static var fetchUserListDataSource = FetchUserListDataSource(apiClient: APIClientContainer.apiClient)
    
}
