//
//  ViewController.swift
//  Messenger
//
//  Created by ahmet karadağ on 25.09.2024.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
       // DatabaseManager.shared.test()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
        validateAuth()

    }
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.navigationBar.tintColor = .green
            present(nav, animated: false, completion: nil)
        }
    }

}

