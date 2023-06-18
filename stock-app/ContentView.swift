//
//  ContentView.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: tabBar.Tab = tabBar.Tab.house
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    if (selectedTab == tabBar.Tab.house) {
                        homeScreen(selectedTab: $selectedTab)

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
                tabBar(selectedTab: $selectedTab)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
