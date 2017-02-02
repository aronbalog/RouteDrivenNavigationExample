//
//  Route+Extension.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 02/02/2017.
//
//

import Foundation
import UIKit

extension Route {
    func push(parameters: [String: Any]? = nil, embeddingType: RouteEmbeddingType? = nil, animated: Bool = true, navigationControllerDelegate: UINavigationControllerDelegate? = nil) {
        
        var transitionType: RouteTransitionType
        if
            let navigationControllerDelegate = navigationControllerDelegate
        {
            transitionType = .pushWithDelegate(navigationControllerDelegate: navigationControllerDelegate)
        } else {
            transitionType = .push
        }
        
        Context.shared.routeProvider.open(route: self, transitionType: transitionType, animated: animated, parameters: parameters, embeddingType: embeddingType)
    }

    func modal(in embeddingType: RouteEmbeddingType? = nil, parameters: [String: Any]? = nil, animated: Bool = true, transitioningDelegate: UIViewControllerTransitioningDelegate? = nil) {
        var transitionType: RouteTransitionType
        
        if
            let transitioningDelegate = transitioningDelegate
        {
            transitionType = .custom(transitioningDelegate: transitioningDelegate)
        } else {
            transitionType = .modal
        }
        
        Context.shared.routeProvider.open(route: self, transitionType: transitionType, animated: animated, parameters: parameters, embeddingType: RouteEmbeddingType.navigationController)
    }
    
}
