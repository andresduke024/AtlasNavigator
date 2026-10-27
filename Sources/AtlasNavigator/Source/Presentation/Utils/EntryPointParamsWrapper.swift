//
//  EntryPointParamsWrapper.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public struct EntryPointParamsWrapper<Content: View, Query: Decodable>: View {
    
    private let content: (Query) -> Content
    
    private let params: Query?
    
    public init(
        _ data: RouteData?,
        @ViewBuilder content: @escaping (Query) -> Content
    ) {
        self.content = content
        
        self.params = data?.resolveQuery()
    }
    
    public var body: some View {
        if let params {
            content(params)
        } else {
            EmptyView()
        }
    }
}
