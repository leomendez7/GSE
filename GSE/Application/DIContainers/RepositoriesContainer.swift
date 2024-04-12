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
        
        RepositoriesContainer.fetchUsersRepository = FetchUserListRepository(datasource: DataSourcesContainer.fetchUserListDataSource)
        RepositoriesContainer.fetchUserInformationRepository = FetchUserInformationRepository(datasource: DataSourcesContainer.fetchUserInformationDataSource)
        
    }
    
    static var fetchUsersRepository = FetchUserListRepository(datasource: DataSourcesContainer.fetchUserListDataSource)
    static var fetchUserInformationRepository = FetchUserInformationRepository(datasource: DataSourcesContainer.fetchUserInformationDataSource)
    
}
