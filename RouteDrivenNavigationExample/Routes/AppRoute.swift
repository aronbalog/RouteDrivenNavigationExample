//
//  AppRoute.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation
import ARoute

enum AppRoute {
    case viewController(viewController: UIViewController)
    case home
    case signIn
    case myProfile
    case userProfile(userId: String)
    case newUserProfile(userId: String)
}

extension AppRoute: Route {
    
    var path: String {
        
        // Every route has it's own path which will be forwarded to ARoute and must
        // be in specific format as defined in registration path
        
        switch self {
        case .viewController(_):
            return "view-controller"
        case .home:
            return "home"
        case .signIn:
            return "sign-in"
        case .myProfile:
            return "my-profile"
        case .userProfile(let userId):
            return "user-profile/\(userId)"
        case .newUserProfile(let userId):
            return "new-user-profile/\(userId)"
        }
    }
    
    var registrationPath: String {
        
        // Registration path can for ARoute
        
        switch self {
        case .userProfile(_):
            return "user-profile/{userId}"
        case .newUserProfile(_):
            return "new-user-profile/{userId}"
        default:
            return path
        }
    }
    
    var redirectRoute: Route {
        
        // redirect route here
        
        switch self {
        case .myProfile:
            return AppRoute.userProfile(userId: "1").redirectRoute
        case .userProfile(let userId):
            return AppRoute.newUserProfile(userId: userId).redirectRoute
        default:
            return self
        }
    }
    
    func getViewController(parameters: [String : Any]? = nil, embeddingType: RouteEmbeddingType? = nil) -> UIViewController? {
        let routeRequest = map(parameters: parameters, embeddingType: embeddingType)
        
        return routeRequest.viewController()
    }
    
    func getEmbeddingViewController(parameters: [String : Any]? = nil, embeddingType: RouteEmbeddingType? = nil) -> UIViewController? {
        let routeRequest = map(parameters: parameters, embeddingType: embeddingType)
        
        return routeRequest.embeddingViewController()
    }
    
    func map(parameters: [String: Any]?, embeddingType: RouteEmbeddingType?) -> ARouteRequestExecutable {
        let routeParameters = parameters ?? [:]
        let router = Context.shared.routeProvider.router
        var routeRequest: ARouteRequestExecutable
        
        switch self {
        case .viewController(let viewController):
            routeRequest = router.viewController(viewController)
        default:
            routeRequest = router.route(path)
        }
        
        if let routeRequest = routeRequest as? ARouteRequestInitiable {
            if let embeddingType = embeddingType {
                switch embeddingType {
                case .navigationController:
                    routeRequest.embedInNavigationController()
                case .tabBarController:
                    routeRequest.embedInTabBarController()
                }
            }
        }
        
        if let routeRequest = routeRequest as? ARouteRequestConfigurable {
            routeRequest.parameters { routeParameters }
        }
        
        return routeRequest
    }
}
