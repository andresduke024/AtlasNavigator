//
//  RouteDataMapper.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 26/10/26.
//

import Foundation

struct RouteDataMapper {
    
    private static let encoder = JSONEncoder()
    
    private static let decoder = JSONDecoder()
    
    static func prepare(data: Encodable?) -> Data? {
        guard let data, let encodeData = try? encoder.encode(data) else {
            return nil
        }
        
        return encodeData
    }
    
    static func resolve<T: Decodable>(from data: Data) -> T? {
        guard let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        
        return object
    }
}
