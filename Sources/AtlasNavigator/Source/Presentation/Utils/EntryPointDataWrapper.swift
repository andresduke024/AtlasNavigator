//
//  EntryPointDataWrapper.swift
//  AtlasNavigator
//
//  Created by Andres Duque on 27/10/26.
//

import SwiftUI

public struct EntryPointDataWrapper<Content: View, Body: Decodable>: View {
    
    private let content: (Body) -> Content
    
    private let data: Body?
    
    public init(
        _ data: RouteData?,
        @ViewBuilder content: @escaping (Body) -> Content
    ) {
        self.content = content
        
        self.data = data?.resolveBody()
    }
    
    public var body: some View {
        if let data {
            content(data)
        } else {
            EmptyView()
        }
    }
}
