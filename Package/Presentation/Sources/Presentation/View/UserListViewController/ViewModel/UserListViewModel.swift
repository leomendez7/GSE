//
//  UserListViewModel.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import Foundation
import Combine
import Domain

public class UserListViewModel: BaseViewModel<FetchUsersListUseCase, UserFlowCoordinator> {
    
    var reloadData = PassthroughSubject<Void, Error>()
    @Published var users: [User] = []
    
    func fetchUsers() async {
        do {
            let users = try await useCase.execute(requestValue: "")
            self.users = users
            reloadData.send()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
