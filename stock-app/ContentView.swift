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
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    if (selectedTab == tabBar.Tab.house) {
                        homeScreen(selectedTab: $selectedTab, refreshing: $refreshing)
                    }
                    
                    if (selectedTab == tabBar.Tab.gainers || selectedTab == tabBar.Tab.losers) {
                        GainerLoserView(selectedTab: $selectedTab, refreshing: $refreshing)
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
