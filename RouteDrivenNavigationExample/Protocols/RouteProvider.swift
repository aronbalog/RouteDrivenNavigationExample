//
//  RouteProvider.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation
import ARoute

protocol RouteProvider {
    var router: ARoute { get }
    var routes: [String: ARoutable.Type] { get }
    var protectedRoutes: [Route] { get }
    
    func open(route: Route, transitionType: RouteTransitionType, animated: Bool, parameters: [String: Any]?, embeddingType: RouteEmbeddingType?)
}

enum RouteEmbeddingType {
    case navigationController
    case tabBarController
}

enum RouteTransitionType {
    case pushWithDelegate(navigationControllerDelegate: UINavigationControllerDelegate)
    case push
    case modal
    case custom(transitioningDelegate: UIViewControllerTransitioningDelegate)
    
    func performTransition(routeRequest: ARouteRequestExecutable) {
        switch self {
        case .push:
            routeRequest.push()
        case .modal:
            routeRequest.execute()
        case .custom(let transitioningDelegate):
            (routeRequest as! ARouteRequestConfigurable).transitioningDelegate { transitioningDelegate }
                .execute()
        case .pushWithDelegate(let navigationControllerDelegate):
            routeRequest.push({ navigationControllerDelegate }, routeResponse: nil)
        }
    }
}
