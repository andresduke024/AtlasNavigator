//
//  BaseRoute.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

public protocol BaseRoute {
    var name: NamedRoute { get }
    var childs: [BaseRoute] { get }
    
    func resolve(
        from routeWrapper: RouteWrapper
    ) -> EntryPoint?
    
    func resolveEntryPoint(
        with data: RouteData?
    ) -> EntryPoint
}

public extension BaseRoute {
    var childs: [BaseRoute] { [] }
    
    func resolve(from routeWrapper: RouteWrapper) -> EntryPoint? {
        let resolvedRoute = routeWrapper.resolve()
        
        guard let route = resolveRoute(from: resolvedRoute) else { return nil }
        
        return route.resolveEntryPoint(with: routeWrapper.getData())
    }
    
    private func resolveRoute(from route: any RouteProtocol) -> BaseRoute? {
        if name.identifier == route.identifier { return self }
        
        return childs.first { $0.name.identifier == route.identifier }
    }
}
