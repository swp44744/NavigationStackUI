//
//  ScanView.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/26/23.
//

import SwiftUI

struct ScanView: View {
//    @EnvironmentObject var router: Router
    let detailData = DetailViewModel(id: 1, name: "My Detail View")
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(value: detailData) {
                Text("Go to details")
            }
            Button {
                print("just pres it")
            } label: {
                Text("just press me")
            }

        }
        .navigationDestination(for: DetailViewModel.self) { details in
            DetailView(detailData: details)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}

struct DetailViewModel: Hashable {
    var id: Int
    var name: String
}
struct SubDetailViewModel: Hashable {
    var id: Int
    var name: String
}

