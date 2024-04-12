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
        UseCasesContainer.fetchUsersListUseCase = FetchUsersListUseCase(repository: RepositoriesContainer.fetchUsersRepository)
        UseCasesContainer.fetchUserInformationUseCase = FetchUserInformationUseCase(repository: RepositoriesContainer.fetchUserInformationRepository)
    }
    
    static var fetchUsersListUseCase = FetchUsersListUseCase(repository: RepositoriesContainer.fetchUsersRepository)
    static var fetchUserInformationUseCase = FetchUserInformationUseCase(repository: RepositoriesContainer.fetchUserInformationRepository)
    
}
