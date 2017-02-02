//
//  SignInViewController.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import UIKit
import ARoute

final class SignInViewController: UIViewController, ARoutable {
    lazy var userSignedInButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Set signed in", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SignInViewController.setSignedIn))
        return button
    }()
    
    lazy var userSignedOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Set signed out", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SignInViewController.setSignedOut))
        return button
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(routeResponse: ARouteResponse) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        if authenticationProvider.isUserSignedIn {
            navigationItem.setLeftBarButton(nil, animated: false)
            navigationItem.setRightBarButton(userSignedOutButton, animated: false)
        } else {
            navigationItem.setLeftBarButton(userSignedInButton, animated: false)
            navigationItem.setRightBarButton(nil, animated: false)
        }
        
        
    }
    
    func setSignedIn() {
        authenticationProvider.setUserSignedIn()
        
        dismiss(animated: true, completion: { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.userDidSignInSubscribers.forEach { (completion: () -> Void) in
                completion()
            }
            strongSelf.userDidSignInSubscribers.removeAll()
        })
    }
    
    func setSignedOut() {
        authenticationProvider.setUserSignedOut()
        
        dismiss(animated: true, completion: nil)
    }
    
    private var userDidSignInSubscribers: [() -> Void] = []
    
    func userDidSignIn(_ completion: @escaping () -> Void) {
        userDidSignInSubscribers.append(completion)
    }
}
