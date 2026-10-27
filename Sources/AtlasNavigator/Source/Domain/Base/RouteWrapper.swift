//
//  Router.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 26/10/26.
//

public enum RouteWrapper: @MainActor RouteProtocol {
    case named(_ name: String)
    case namedWithData(_ name: String, _ data: RouteData)

    public var identifier: String {
        resolve().identifier
    }

    func getData() -> RouteData? {
        return switch self {
        case .named(_): nil
        case .namedWithData(_, let data): data
        }
    }

    func resolve() -> any RouteProtocol {
        return switch self {
        case .named(let name): resolveNamed(from: name)
        case .namedWithData(let name, _): resolveNamed(from: name)
        }
    }

    private func resolveNamed(from name: String) -> NamedRoute {
        return NamedRoute(host: name)
    }
}
