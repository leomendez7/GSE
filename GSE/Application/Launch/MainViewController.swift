//
//  MainViewController.swift
//  GSE
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Presentation
import Domain

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupRootViewController()
    }
    
    func setupRootViewController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return }
        let usersListViewController = UsersListContainer.shared.usersListViewController()
        window.rootViewController = UINavigationController(rootViewController: usersListViewController)
    }

}

