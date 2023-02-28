//
//  CountryListView.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/16/23.
//

import SwiftUI

struct CountryListView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        List(Country.sample) { country in
            NavigationLink(value: country) {
                HStack {
                    Text(country.flag)
                    Text(country.name)
                }
            }
            .navigationTitle("Countries")
            .navigationDestination(for: Country.self) { country in
                CountryView(country: country)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
            .environmentObject(Router())
    }
}
