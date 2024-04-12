//
//  UserDetailsViewController.swift
//
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Domain
import Combine

@MainActor
public class UserDetailsViewController: BaseViewController<UserDetailsViewModel> {
    
    private var anyCancellable = Set<AnyCancellable>()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Information"
        subscribeToViewModel()
        Task {
            await viewModel.fetchUser()
        }
    }
    
    private func subscribeToViewModel() {
        viewModel.reloadData.receive(on: DispatchQueue.main).sink { _  in } receiveValue: { _ in
            self.configureLabels(user: self.viewModel.user)
        }.store(in: &anyCancellable)
    }
    
    func configureLabels(user: User?) {
        guard let user = user else { return }
        let attributedString = NSAttributedString(string: user.website, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        nameLabel.text = user.name
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        userNameLabel.text = user.username
        addressLabel.text = "\(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
        companyLabel.text = user.company.name
        descriptionLabel.text = user.company.catchPhrase
        websiteLabel.attributedText = attributedString
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        websiteLabel.isUserInteractionEnabled = true
        websiteLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(viewModel.userId ?? "")") {
            UIApplication.shared.open(url)
        }
    }

}
