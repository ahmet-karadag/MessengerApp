//
//  ProfileViewController.swift
//  Messenger
//
//  Created by ahmet karadağ on 25.09.2024.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let data = ["Log out"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let logOut = data[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = logOut
        content.textProperties.adjustsFontSizeToFitWidth = true
        content.textProperties.alignment = .center
        content.textProperties.color = .blue
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { [weak self] _ in
            guard let strongSelf = self else{
                return
            }
            do{
                try FirebaseAuth.Auth.auth().signOut()
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                nav.navigationBar.tintColor = .green
                strongSelf.present(nav, animated: true, completion: nil)
            
            }catch{
                print("failed log out")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)

    }
    
}
