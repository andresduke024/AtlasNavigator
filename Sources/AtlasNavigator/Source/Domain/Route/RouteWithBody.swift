//
//  RouteWithBody.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public protocol RouteWithBody: BaseRoute {
    
    associatedtype Content: View
    associatedtype T: Decodable
    
    var entryPoint: (T) -> Content { get }
}

public extension RouteWithBody {
    func resolveEntryPoint(
        with data: RouteData?
    ) -> EntryPoint {
        return {
            EntryPointDataWrapper(data) { (mappedData: T) in
                entryPoint(mappedData)
            }
        }
    }
}
