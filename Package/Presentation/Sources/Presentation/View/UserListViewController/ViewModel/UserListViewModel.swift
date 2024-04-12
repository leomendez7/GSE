//
//  UserListViewModel.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Combine
import Domain
import Shared

public class UserListViewModel: BaseViewModel<FetchUsersListUseCase, UserFlowCoordinator> {
    
    var reloadData = PassthroughSubject<Void, Error>()
    @Published var users: [User] = []
    
    func fetchUsers() async {
        do {
            let users = try await useCase.execute(requestValue: "")
            self.users = users
            reloadData.send()
            AppLogger.info(users)
        } catch let error {
            AppLogger.error(error.localizedDescription, context: error)
        }
    }
    
}
