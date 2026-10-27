//
//  NavigatorRoute.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

public enum NavigatorRoute {
    case named(
        _ name: String
    )
    case namedWithBody(
        _ name: String,
        _ body: Encodable
    )
    case namedWithParams(
        _ name: String,
        _ params: Encodable
    )
    case namedWithData(
        _ name: String,
        _ body: Encodable,
        _ params: Encodable
    )

    func wrap() -> RouteWrapper {
        switch self {
        case .named(let name):
            .named(name)
        case .namedWithBody(let name, let body):
            .namedWithData(name, RouteData(body: body))
        case .namedWithParams(let name, let params):
            .namedWithData(name, RouteData(query: params))
        case .namedWithData(let name, let body, let params):
            .namedWithData(name, RouteData(body: body, query: params))
        }
    }
}
