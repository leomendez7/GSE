//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Shared
import Domain
import Data

public class BaseViewController<ViewModel>: UIViewController {
    
    var viewModel: ViewModel
    
    // MARK: - Init
    
    public init?(viewModel: ViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    public init?(viewModel: ViewModel, nibName: String, bundle: Bundle? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
