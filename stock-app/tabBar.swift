//
//  tabBar.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/17/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case gainers = "arrow.up.forward.circle"
    case losers = "arrow.down.forward.circle"
    case refresh = "arrow.clockwise.circle"
}

struct tabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) {
                    tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar(selectedTab: .constant(.house))
    }
}
