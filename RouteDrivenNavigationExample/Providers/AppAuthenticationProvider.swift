//
//  AppAuthenticationProvider.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation

final class AppAuthenticationProvider: AuthenticationProvider {
    private var _isUserSignedIn = false
    
    var isUserSignedIn: Bool {
        return _isUserSignedIn
    }
    
    func setUserSignedIn() {
        _isUserSignedIn = true
    }
    
    func setUserSignedOut() {
        _isUserSignedIn = false
    }
}
