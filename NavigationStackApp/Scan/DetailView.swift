//
//  DetailView.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/27/23.
//

import SwiftUI

struct DetailView: View {
    var detailData: DetailViewModel?
    let subDetailData = SubDetailViewModel(id: 1, name: "My SUB Detail View")
    var body: some View {
        VStack(spacing: 20) {
            Text(detailData?.name ?? "Generic Detail Name")
            NavigationLink(value: subDetailData) {
                Text("Go to Sub-details")
            }
            .navigationDestination(for: SubDetailViewModel.self) { details in
                SubDetailView(subDetailData: details)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
