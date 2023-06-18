//
//  ContentView.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    if (selectedTab == Tab.house) {
                        homeScreen()

                    }
                    
                    if (selectedTab == Tab.gainers) {
                        Text("message").bold()

                    }
                    
                    if (selectedTab == Tab.losers) {
                        Text("refresh").bold()

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
