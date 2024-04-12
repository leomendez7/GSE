//
//  UserListViewController.swift
//  
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Combine

public class UsersListViewController: BaseViewController<UserListViewModel> {

    private var anyCancellable = Set<AnyCancellable>()
    
    @IBOutlet weak var tableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.coordinator.navigationController = navigationController
        subscribeToViewModel()
        Task { await self.viewModel.fetchUsers() }
    }

    private func subscribeToViewModel() {
        viewModel.reloadData.receive(on: DispatchQueue.main).sink { _  in } receiveValue: { _ in
            self.tableView.reloadData()
        }.store(in: &anyCancellable)
    }
    
}

extension UsersListViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UsersListTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "usersListTableViewCell",
            for: indexPath
        ) as? UsersListTableViewCell else { return UsersListTableViewCell() }
        cell.configure(user: viewModel.users[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel
            .coordinator
            .navigate(to: .userDetails(userId: "\(viewModel.users[indexPath.row].id)"))
    }
    
}
