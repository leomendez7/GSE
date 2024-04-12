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

final class UserContainer: UserListFactory {
    
    static let shared = UserContainer()
    
    lazy var userCoordinator: UserFlowCoordinator = {
        return UserFlowCoordinator(factory: self)
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
        let coordinator = userCoordinator
        let viewModel = UserListViewModel(useCase: UseCasesContainer.fetchUsersListUseCase,
                              coordinator: coordinator)
        return viewModel
    }
    
    private func userDetailsViewModel(userId: String) -> UserDetailsViewModel {
        let coordinator = userCoordinator
        let viewModel = UserDetailsViewModel(useCase: UseCasesContainer.fetchUserInformationUseCase,
                              coordinator: coordinator)
        viewModel.userId = userId
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
   
    @MainActor
    func userDetailsViewController(userId: String) -> UserDetailsViewController {
        let identifier = "UserDetails"
        let storyBoard = UIStoryboard(name: identifier, bundle: Presentation.bundle)
        let viewController = storyBoard.instantiateViewController(identifier: identifier) { coder in
            return UserDetailsViewController(viewModel: self.userDetailsViewModel(userId: userId), coder: coder)
        }
        return viewController
    }
    
    
}
