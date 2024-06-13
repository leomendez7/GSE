//
//  UserDetailsViewModel.swift
//
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation
import Domain
import Combine

public class UserDetailsViewModel: BaseViewModel<FetchUserInformationUseCase, UserFlowCoordinator> {
    
    public var userId: String?
    var user: User?
    var reloadData = PassthroughSubject<Void, Error>()
    
    func fetchUser() async {
        do {
            let user = try await useCase.execute(requestValue: userId ?? "")
            self.user = user
            reloadData.send()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
