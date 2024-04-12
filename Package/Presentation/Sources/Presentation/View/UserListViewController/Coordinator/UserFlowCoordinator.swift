//
//  UserListFlowCoordinator.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Domain

public enum UserFlowRoute {
    
    case usersList
    case userDetails(userId: String)
    
}

public class UserFlowCoordinator: BaseFlowCoordinator {
    
    public var navigationController: UINavigationController?
    public var factory: UserListFactory
    
//    private lazy var userDetailsViewController: UserDetailsViewController = {
//        return factory.userDetailsViewController(userId: <#String#>)
//    }()
    
    public init(factory: UserListFactory) {
        self.factory = factory
    }
        
    public func navigate(to flowRoute: UserFlowRoute) {
        switch flowRoute {
        case .usersList:
            showUsersList()
        case .userDetails(let userId):
            showUserDetails(userId: userId)
        }
    }
    
    // MARK: - Routes
    
    private func showUsersList() {
    }
    
    private func showUserDetails(userId: String) {
        let userDetailsViewController = factory.userDetailsViewController(userId: userId)
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

