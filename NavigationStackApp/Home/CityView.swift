//
//  CityView.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/16/23.
//

import SwiftUI
import Charts

struct CityView: View {

    var city: City
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: 100) {
            Text(city.name)
            Chart(city.fellowCities) { city in
                BarMark(x: .value("City", city.name), y: .value("Population", city.population))
                    .foregroundStyle(by: .value("City", city.name))
            }
            .chartLegend(.hidden)
            .padding()
            Button("Select Country") {
                router.reset()
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(city: Country.sample[0].cities[0])
            .environmentObject(Router())
    }
}
