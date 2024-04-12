//
//  UserListFlowCoordinator.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Domain

public enum UserListFlowRoute {
    
    case usersList
    case userDetails
    
}

public class UserListFlowCoordinator: BaseFlowCoordinator {
    
    public var navigationController: UINavigationController?
    public var factory: UserListFactory
    
    private lazy var userDetailsViewController: UserDetailsViewController = {
       return factory.userDetailsViewController()
    }()
    
    public init(factory: UserListFactory) {
        self.factory = factory
    }
        
    public func navigate(to flowRoute: UserListFlowRoute) {
        switch flowRoute {
        case .usersList:
            showUsersList()
        case .userDetails:
            showUserDetails()
        }
    }
    
    // MARK: - Routes
    
    private func showUsersList() {
    }
    
    private func showUserDetails() {
        let userDetailsViewController = factory.userDetailsViewController()
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
    
}

extension UIViewController {
    func presentOnRoot(`with` viewController : UIViewController){
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(navigationController, animated: false, completion: nil)
    }
}

