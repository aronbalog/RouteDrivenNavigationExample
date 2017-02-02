//
//  Context.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation

final class Context {
    static let shared: Context = Context()
    
    let routeProvider: RouteProvider = AppRouteProvider()
    let authenticationProvider: AuthenticationProvider = AppAuthenticationProvider()
    
    private init() {}
}
