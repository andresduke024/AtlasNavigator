//
//  RouteWithData.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public protocol RouteWithData: BaseRoute {
    
    associatedtype Content: View
    associatedtype Body: Decodable
    associatedtype Params: Decodable
    
    var entryPoint: (Body, Params) -> Content { get }
}

public extension RouteWithData {
    func resolveEntryPoint(
        with data: RouteData?
    ) -> EntryPoint {
        return {
            EntryPointWrapper(data) { (body: Body, params: Params) in
                entryPoint(body, params)
            }
        }
    }
}
