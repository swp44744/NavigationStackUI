//
//  Models.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/16/23.
//

import Foundation

struct Country: Identifiable, Hashable {
    var name: String
    var flag: String
    var population: Int
    var cities: [City]
    var id: String {
        name
    }
    
    static var sample: [Country] {
        [
            Country(name: "India", flag: "IN", population: 23453434, cities: City.all.filter{$0.country == "India"}),
            Country(name: "United States", flag: "US", population: 23453434, cities: City.all.filter{$0.country == "United States"}),
            Country(name: "Canada", flag: "CD", population: 23453434, cities: City.all.filter{$0.country == "Canada"}),
            Country(name: "France", flag: "FR", population: 23453434, cities: City.all.filter{$0.country == "France"}),
            Country(name: "Mexico", flag: "MX", population: 23453434, cities: City.all.filter{$0.country == "Mexico"}),
            Country(name: "United Kingdom", flag: "UK", population: 23453434, cities: City.all.filter{$0.country == "UK"}),
        ]
    }
    
}

struct City: Identifiable, Hashable {
    var name: String
    var country: String
    var isCapital: Bool
    var population: Int
    var id: String {
        name
    }
    static var all: [City] {
        [
            City(name: "Mumbai", country: "India", isCapital: false, population: 234234),
            City(name: "Delhi", country: "India", isCapital: true, population: 2234),
            City(name: "Nashik", country: "India", isCapital: false, population: 1234),
            City(name: "Palghar", country: "India", isCapital: false, population: 24234),
            City(name: "Milpitas", country: "United States", isCapital: false, population: 234234),
            City(name: "Sunnyvale", country: "United States", isCapital: false, population: 234234),
            City(name: "Washington", country: "United States", isCapital: true, population: 234234),
            City(name: "Bloomington", country: "United States", isCapital: false, population: 234234),
            City(name: "Salt lake city", country: "United States", isCapital: false, population: 234234),
            City(name: "Ottawa", country: "Canada", isCapital: true, population: 234234),
            City(name: "Paris", country: "France", isCapital: true, population: 234234),
            City(name: "Mehico", country: "Mexico", isCapital: true, population: 234234),
            City(name: "London", country: "United Kingdom", isCapital: true, population: 234234),
        ]
    }
    
    var fellowCities: [City] {
        Self.all.filter {$0.country == country}
    }
}
