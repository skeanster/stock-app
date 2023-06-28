//
//  homeScreen.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/17/23.
//

import SwiftUI

struct homeScreen: View {
    @Binding var selectedTab: tabBar.Tab
    @Binding var refreshing: Bool
    @StateObject var viewModel = ViewModel()

    func clickGainers() {
        selectedTab = tabBar.Tab.gainers
    }
    
    func clickLosers() {
        selectedTab = tabBar.Tab.losers
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action:{self.clickGainers()}) {
                VStack {
                    Image(systemName: "arrow.up.forward.circle.fill").font(.system(size: 60)) .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.green)

                    Text("Gainers")
                        .foregroundColor(.black)
                }
                .frame(width: 200, height: 200)
                .background(.thinMaterial)
                .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action:{self.clickLosers()}) {
                VStack {
                    Image(systemName: "arrow.down.forward.circle.fill").font(.system(size: 60)) .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.red)
                    Text("Losers")
                        .foregroundColor(.black)
                }
                .frame(width: 200, height: 200)
                .background(.thinMaterial)
                .cornerRadius(10)
            }
            
            Spacer()
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .top)
        .background(.white)
    }
}

struct homeScreen_Previews: PreviewProvider {
    static var previews: some View {
        homeScreen(selectedTab: .constant(tabBar.Tab.house), refreshing: .constant(false))
    }
}
