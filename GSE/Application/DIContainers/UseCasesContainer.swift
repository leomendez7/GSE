//
//  UseCasesContainer.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Domain

final class UseCasesContainer {
    
    class func reloadLoginUseCases() {
        RepositoriesContainer.reloadLoginRepositories()
        UseCasesContainer.fetchUserListUseCase = FetchUsersListUseCase(repository: RepositoriesContainer.fetchUserRepository)
        
    }
    
    static var fetchUserListUseCase = FetchUsersListUseCase(repository: RepositoriesContainer.fetchUserRepository)
    
}
