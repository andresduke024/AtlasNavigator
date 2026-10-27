//
//  EntryPointWrapper.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public struct EntryPointWrapper<Content: View, Body: Decodable, Query: Decodable>: View {
    
    private let content: (Body, Query) -> Content
    
    private let data: Body?
    private let params: Query?
    
    public init(
        _ data: RouteData?,
        @ViewBuilder content: @escaping (Body, Query) -> Content
    ) {
        self.content = content
        
        self.data = data?.resolveBody()
        self.params = data?.resolveQuery()
    }
    
    public var body: some View {
        if let data, let params {
            content(data, params)
        } else {
            EmptyView()
        }
    }
}
