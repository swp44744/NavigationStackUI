//
//  Router.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/16/23.
//

import SwiftUI

class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func reset() {
        path = NavigationPath()
    }
}
