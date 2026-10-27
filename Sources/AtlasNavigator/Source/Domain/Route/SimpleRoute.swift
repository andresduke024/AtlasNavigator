//
//  SimpleRoute.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public protocol SimpleRoute: BaseRoute {
    var entryPoint: EntryPoint { get }
}

public extension SimpleRoute {
    func resolveEntryPoint(
        with data: RouteData?
    ) -> EntryPoint {
        return { entryPoint() }
    }
}
