//
//  RouteWithParams.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public protocol RouteWithParams: BaseRoute {
    
    associatedtype Content: View
    associatedtype T: Decodable
    
    var entryPoint: (T) -> Content { get }
}

public extension RouteWithParams {
    func resolveEntryPoint(
        with data: RouteData?
    ) -> EntryPoint {
        return {
            EntryPointParamsWrapper(data) { (mappedData: T) in
                entryPoint(mappedData)
            }
        }
    }
}
