//
//  MyProfileViewController.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import UIKit
import ARoute

final class MyProfileViewController: UIViewController, ARoutable {
    lazy var closeBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: self, action: #selector(close))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(routeResponse: ARouteResponse) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        navigationItem.setRightBarButton(closeBarButtonItem, animated: false)
    }

    func close() {
        dismiss(animated: true, completion: nil)
    }
}
