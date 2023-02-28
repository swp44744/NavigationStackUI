//
//  NavigationStackAppApp.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/16/23.
//

import SwiftUI

@main
struct NavigationStackAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var router = Router()
    @State var selectedIndex: Int = 0
    
    var body: some Scene {
        WindowGroup {
            HomeView(selectedIndex: $selectedIndex)
                .environmentObject(router)
                .onOpenURL { url in
                    guard let scheme = url.scheme, scheme == "AGLINK" else {
                        return
                        
                    }
                    guard let tabName = url.host?.lowercased(),
                          let tabType = TabType.allCases.first(where: { $0.tabName == tabName }) else {
                        return
                    }
                    // Select appropriate tab
                    switch tabType {
                    case .home:
                        self.selectedIndex = 0
                        handleHomeDeeplink(url: url)
                    case .scan:
                        self.selectedIndex = 1
                    case .profile:
                        self.selectedIndex = 2
                    }
                }
        }
    }
    func handleHomeDeeplink(url: URL) {
        if url.pathComponents.count == 2 {
            let country = url.lastPathComponent
            let _ = getCountry(for: country)
        } else if url.pathComponents.count == 3 {
            let country = url.pathComponents[1]
            if let foundCountry = getCountry(for: country) {
                let city = url.lastPathComponent
                if let foundCity = foundCountry.cities.first(where: {$0.name == city}) {
                    router.path.append(foundCity)
                }
            }
            
        }
    }
    func getCountry(for country: String) -> Country? {
        if let foundCountry = Country.sample.first(where: { $0.name == country }) {
            router.reset()
            router.path.append(foundCountry)
            return foundCountry
        }
        return nil
    }
}
