//
//  NamedRoute.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 26/10/26.
//

public struct NamedRoute: @MainActor RouteProtocol {
    
    private let host: String
    private let path: String
    
    public var identifier: String { host + path }
    
    public init(
        host: String,
        path: String
    ) {
        self.host = host
        self.path = path
    }
    
    public init(host: String) {
        self.init(host: host, path: "")
    }
    
    public init(path: String) {
        self.init(host: "", path: path)
    }
}
