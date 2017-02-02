//
//  AuthenticationProvider.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation

protocol AuthenticationProvider {
    var isUserSignedIn: Bool { get }
    
    func setUserSignedIn()
    func setUserSignedOut()
}
