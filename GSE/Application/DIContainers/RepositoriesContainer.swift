//
//  RepositoriesContainer.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Data
import Domain

final class RepositoriesContainer {
    
    class func reloadLoginRepositories() {
        DataSourcesContainer.reloadLoginApiClients()
        
        RepositoriesContainer.fetchUserRepository = FetchUserListRepository(datasource: DataSourcesContainer.fetchUserListDataSource)
        
    }
    
    static var fetchUserRepository = FetchUserListRepository(datasource: DataSourcesContainer.fetchUserListDataSource)
    
}
