//
//  UIViewController.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation
import UIKit

extension UIViewController {
    func open(route: Route, transitionType: RouteTransitionType, animated: Bool = true, parameters: [String: Any]? = nil, embeddingType: RouteEmbeddingType? = nil) {
        Context.shared.routeProvider.open(route: route, transitionType: transitionType, animated: animated, parameters: parameters, embeddingType: embeddingType)
    }
    
    func push(route: Route, animated: Bool = true, parameters: [String: Any]? = nil) {
        open(route: route, transitionType: .push, animated: animated, parameters: parameters)
    }
    
    func modal(route: Route, animated: Bool = true, parameters: [String: Any]? = nil, embeddingType: RouteEmbeddingType? = nil) {
        open(route: route, transitionType: .modal, animated: animated, parameters: parameters, embeddingType: embeddingType)
    }
    
    var authenticationProvider: AuthenticationProvider {
        return Context.shared.authenticationProvider
    }
}
