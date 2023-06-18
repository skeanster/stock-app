//
//  ContentView.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: tabBar.Tab = tabBar.Tab.house
    @State var refreshing: Bool = false
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    if (selectedTab == tabBar.Tab.house) {
                        homeScreen(selectedTab: $selectedTab, refreshing: $refreshing)

                    }
                    
                    if (selectedTab == tabBar.Tab.gainers) {
                        Text("Gainers").bold()

                    }
                    
                    if (selectedTab == tabBar.Tab.losers) {
                        Text("Losers").bold()

                    }
                }
            }
            
            VStack {
                Spacer()
                tabBar(selectedTab: $selectedTab, refreshing: $refreshing)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
