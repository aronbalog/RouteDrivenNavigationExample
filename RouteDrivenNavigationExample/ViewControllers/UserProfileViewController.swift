//
//  UserProfileViewController.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import UIKit
import ARoute

class UserProfileViewController: UIViewController, ARoutable {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(routeResponse: ARouteResponse) {
        super.init(nibName: nil, bundle: nil)
    }
    
}
