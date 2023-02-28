//
//  HomeView.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/26/23.
//

import SwiftUI

enum TabType: Int, CaseIterable {
    case home = 0
    case scan
    case profile

    var tabName: String {
        switch self {
        case .home:
            return "home"
        case .scan:
            return "scan"
        case .profile:
            return "profile"
            
        }
    }
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "house", selectedImage: "house", title: "Home")
        case .scan:
            return TabItemData(image: "scanner", selectedImage: "scanner", title: "Scan")
        case .profile:
            return TabItemData(image: "gearshape", selectedImage: "gearshape", title: "Profile")
        }
    }
}
struct TabItemData {
    let image: String
    let selectedImage: String
    let title: String
}

struct HomeView: View {
    
    @Binding var selectedIndex: Int
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
                CustomTabView1(tabs: TabType.allCases.map({ $0.tabItem }),
                               selectedIndex: $selectedIndex) { index in
                    let type = TabType(rawValue: index) ?? .home
                    getTabView(type: type)
                    
            }
        }
    }

    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            CountryListView()
        case .scan:
            ScanView()
        case .profile:
            ProfileView()
        }
    }
}

struct CustomTabView1<Content: View>: View {

    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(tabs.indices) { index in
                content(index)
                    .tabItem {
                        Label(tabs[index].title, systemImage: tabs[index].image)
                    }
                    .tag(index)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedIndex: .constant(0))
    }
}

