//
//  RouteData.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 26/10/26.
//

import Foundation

public struct RouteData: Hashable, Equatable {
    private let body: Data?
    private let query: Data?
    
    public init(
        body: Encodable?,
        query: Encodable?
    ) {
        self.body = RouteDataMapper.prepare(data: body)
        self.query = RouteDataMapper.prepare(data: query)
    }
    
    public init(body: Encodable?) {
        self.init(body: body, query: nil)
    }
    
    public init(query: Encodable?) {
        self.init(body: nil, query: query)
    }
    
    func resolveBody<T: Decodable>() -> T? {
        guard let body else { return nil }
        
        return RouteDataMapper.resolve(from: body)
    }
    
    func resolveQuery<T: Decodable>() -> T? {
        guard let query else { return nil }
        
        return RouteDataMapper.resolve(from: query)
    }
}
