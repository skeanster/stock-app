//
//  GainerLoserView.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/19/23.
//

import SwiftUI

public enum Test: String, CaseIterable {
    case house
    case gainers = "arrow.up.forward.circle"
    case losers = "arrow.down.forward.circle"
}

struct GainerLoserView: View {
    @Binding var selectedTab: tabBar.Tab
    @Binding var refreshing: Bool
    
    func isGainerTab() -> Bool {
        if (selectedTab == tabBar.Tab.gainers) {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Spacer()
                    VStack {
                        Text("Top Gainers")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundStyle(.white)
                        Text("06/19/2023")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)

                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: 200,
                      alignment: .center
                    )
                .background(isGainerTab() ? .green : .red)
                Spacer()
                
                
            }
            
            VStack {
                ForEach(Test.allCases, id: \.rawValue) {
                    tab in
                    HStack {
                        Image(systemName: "arrow.clockwise.circle")
                        Text("ryan")
                    }
                }
            }
        }
    }
}

struct GainerLoserView_Previews: PreviewProvider {
    static var previews: some View {
        GainerLoserView(selectedTab: .constant(.house), refreshing: .constant(true))
    }
}
