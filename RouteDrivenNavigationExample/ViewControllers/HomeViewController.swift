//
//  HomeViewController.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import UIKit
import ARoute

final class HomeViewController: UIViewController, ARoutable {
    
    lazy var myProfileBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: "My profile", style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeViewController.openMyProfile))
    }()
    lazy var signInBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: "Auth", style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeViewController.openSignIn))
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(routeResponse: ARouteResponse) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setRightBarButton(myProfileBarButtonItem, animated: false)
        navigationItem.setLeftBarButton(signInBarButtonItem, animated: false)
    }
    
    func openSignIn() {
        AppRoute.signIn.modal(in: .navigationController)
    }
    
    func openMyProfile() {
        push(route: AppRoute.myProfile)
    }
}
