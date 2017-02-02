//
//  NewUserViewController.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 23/01/2017.
//
//

import UIKit
import ARoute

class NewUserProfileViewController: UIViewController, ARoutable {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(routeResponse: ARouteResponse) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
}
