//
//  UserListContainer.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Foundation
import Presentation
import Domain


final class UsersListContainer: UserListFactory {
    
    static let shared = UsersListContainer()
    
    lazy var userListCoordinator: UserListFlowCoordinator = {
        return UserListFlowCoordinator(factory: self)
    }()
    
    private init() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(updateUseCases(_:)),
            name: .reloadUseCases,
            object: nil
        )
    }
    
    @objc func updateUseCases(_ notification: NSNotification) {
        UseCasesContainer.reloadLoginUseCases()
    }
    
    private var userListViewModel: UserListViewModel {
        let coordinator = userListCoordinator
        let viewModel = UserListViewModel(useCase: UseCasesContainer.fetchUserListUseCase,
                              coordinator: coordinator)
        return viewModel
    }
    
    func usersListViewController() -> UsersListViewController {
        let identifier = "UsersList"
        let storyBoard = UIStoryboard(name: identifier, bundle: Presentation.bundle)
        let viewController = storyBoard.instantiateViewController(identifier: identifier) { coder in
            return UsersListViewController(viewModel: self.userListViewModel, coder: coder)
        }
        return viewController
    }
   
    func userDetailsViewController() -> UserDetailsViewController {
        let identifier = "Login"
        let storyBoard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: identifier) { coder in
            return UserDetailsViewController()
        }
        return viewController
    }
    
    
}
