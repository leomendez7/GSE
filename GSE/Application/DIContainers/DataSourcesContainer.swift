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
        DataSourcesContainer.fetchUserListDataSource = FetchUsersListDataSource(urlBase: APIClientContainer.urlBase)
        DataSourcesContainer.fetchUserInformationDataSource = FetchUserInformationDataSource(urlBase: APIClientContainer.urlBase)
    }
    
    static var fetchUserListDataSource = FetchUsersListDataSource(urlBase: APIClientContainer.urlBase)
    static var fetchUserInformationDataSource = FetchUserInformationDataSource(urlBase: APIClientContainer.urlBase)
}
