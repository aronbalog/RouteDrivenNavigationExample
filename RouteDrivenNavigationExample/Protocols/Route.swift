//
//  Route.swift
//  RouteDrivenNavigationExample
//
//  Created by Aron Balog on 22/01/2017.
//
//

import Foundation
import ARoute

protocol Route {
    var path: String { get }
    var registrationPath: String { get }
    var redirectRoute: Route { get }
    func getViewController(parameters: [String: Any]?, embeddingType: RouteEmbeddingType?) -> UIViewController?
    func getEmbeddingViewController(parameters: [String : Any]?, embeddingType: RouteEmbeddingType?) -> UIViewController?
    func map(parameters: [String: Any]?, embeddingType: RouteEmbeddingType?) -> ARouteRequestExecutable
}
