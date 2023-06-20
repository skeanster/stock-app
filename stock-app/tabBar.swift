//
//  tabBar.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/17/23.
//

import SwiftUI

struct tabBar: View {
    @Binding var selectedTab: Tab
    @Binding var refreshing: Bool
    @State private var scaleFactor:CGFloat = 1
    @State private var rotateDegrees:CGFloat = 0
    
    
    public enum Tab: String, CaseIterable {
        case house
        case gainers = "arrow.up.forward.circle"
        case losers = "arrow.down.forward.circle"
    }
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    func animateRefresh() {
        scaleFactor = 1.2
        rotateDegrees = (rotateDegrees == 0 ? 360 : 0)
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            scaleFactor = 1
        }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) {
                    tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
                Spacer()
                Image(systemName: "arrow.clockwise.circle")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .scaleEffect(scaleFactor)
                    .rotationEffect(.degrees(rotateDegrees))
                    .onTapGesture {
                        animateRefresh()
                        print(refreshing)
                        refreshing = true
                    }
                    .animation(
                        .easeIn(duration: 0.2)
                        , value: scaleFactor
                    )

                Spacer()
            }
            .frame(width: nil, height: 60)
            .background(.black)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar(selectedTab: .constant(.house), refreshing: .constant(true))
    }
}
