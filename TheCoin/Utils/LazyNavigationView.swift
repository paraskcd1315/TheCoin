//
//  LazyNavigationView.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-16.
//

import SwiftUI

struct LazyNavigationView <Content: View> : View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
