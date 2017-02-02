//
//  RouteProvider.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation
import ARoute

final class AppRouteProvider: RouteProvider {
    var router: ARoute = ARoute.sharedRouter()
    var routes: [String : ARoutable.Type] = [
        AppRoute.home.registrationPath: HomeViewController.self,
        AppRoute.signIn.registrationPath: SignInViewController.self,
        AppRoute.myProfile.registrationPath: MyProfileViewController.self,
        AppRoute.userProfile(userId: "").registrationPath: UserProfileViewController.self,
        AppRoute.newUserProfile(userId: "").registrationPath: NewUserProfileViewController.self
    ]
    var protectedRoutes: [Route] = [
        AppRoute.myProfile
    ]
    
    func open(route: Route, transitionType: RouteTransitionType, animated: Bool = true, parameters: [String: Any]? = nil, embeddingType: RouteEmbeddingType? = nil) {
        let route = route.redirectRoute
        
        guard !_shouldProtect(route: route) else {
            _protect(route: route) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.open(route: route, transitionType: transitionType, animated: animated, parameters: parameters, embeddingType: embeddingType)
            }
            
            return
        }

        let routeRequest = route.map(parameters: parameters, embeddingType: embeddingType)
        
        transitionType.performTransition(routeRequest: routeRequest)
    }
    
    init() {
        _registerRoutes()
    }

}

fileprivate extension AppRouteProvider {
    func _registerRoutes() {
        router.registerRoutes(routes).execute()
    }
    
    func _isRouteProtected(route: Route) -> Bool {
        return protectedRoutes.contains { $0.redirectRoute.path == route.path }
    }
    
    func _shouldProtect(route: Route) -> Bool {
        let isUserSignedIn = Context.shared.authenticationProvider.isUserSignedIn
        let shouldProtect = _isRouteProtected(route: route) && !isUserSignedIn
        
        return shouldProtect
    }
    
    func _protect(route: Route, unprotectBlock: @escaping () -> Void) {
        if let viewController = AppRoute.signIn.getViewController() as? SignInViewController {
            viewController.userDidSignIn {
                unprotectBlock()
            }
            
            let route = AppRoute.viewController(viewController: viewController)
            
            open(route: route, transitionType: .modal, animated: true, parameters: nil, embeddingType: RouteEmbeddingType.navigationController)
        }
    }
}
