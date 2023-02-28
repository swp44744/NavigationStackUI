//
//  SubDetailView.swift
//  NavigationStackApp
//
//  Created by Swapnil Raut on 2/27/23.
//

import SwiftUI

struct SubDetailView: View {
    let subDetailData: SubDetailViewModel
    let details = DetailViewModel(id: 2, name: "Came through router")
    @EnvironmentObject var router: Router
    var body: some View {
        VStack(spacing: 20) {
            Text(subDetailData.name)
            Button {
                router.reset()
            } label: {
                Text("Go to root scan view")
            }
            Button {
                router.path.append(details)
            } label: {
                Text("Go to Details")
            }

        }
        
    }
}

struct SubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubDetailView(subDetailData: SubDetailViewModel(id: 0, name: "hello"))
    }
}
