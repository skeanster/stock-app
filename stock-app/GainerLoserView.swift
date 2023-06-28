//
//  GainerLoserView.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/19/23.
//

import SwiftUI

struct GainerLoserView: View {
    @Binding var selectedTab: tabBar.Tab
    @Binding var refreshing: Bool
    @StateObject var viewModel = ViewModel()
    
    func isGainerTab() -> Bool {
        if (selectedTab == tabBar.Tab.gainers) {
            return true
        } else {
            return false
        }
    }
    
    func roundNumber(num: Double) -> String {
        var temp = round(num*100)
        temp = temp/100.0
        
        return String(temp)+"%"
    }
    
    func getDate() -> String {
        let date = Date()
        let calendar = Calendar.current

        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)

        let theDate = "\(day)/\(month)/\(year)"
        
        return theDate
    }
    
    func getTitle() -> String {
        if (selectedTab == tabBar.Tab.gainers) {
            return "Top Gainers"
        } else {
            return "Top Losers"
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Spacer()
                    VStack {
                        Text(getTitle())
                            .font(.system(size: 30))
                            .bold()
                            .foregroundStyle(.white)
                        Text(getDate())
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
            VStack{
                Spacer()
                ScrollView {
                    VStack {
                        ForEach(viewModel.retrievedData, id: \.self) {
                            stock in
                            HStack {
                                (isGainerTab() ?
                                Image(systemName: "arrow.up.forward.square") :
                                Image(systemName: "arrow.down.forward.square"))
                                .foregroundStyle(isGainerTab() ? .green : .red)
                                .font(.system(size: 30))
                                
                                VStack {
                                    Text(stock.symbol)
                                        .font(.system(size: 15))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(stock.name)
                                        .font(.system(size: 10))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Text(roundNumber(num: stock.changesPercentage))
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()

                            Divider()
                             .frame(height: 1)
                             .padding(.horizontal, 40)
                             .background(.tertiary)
                        }
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                    .onAppear{viewModel.fetch(method: selectedTab)}
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: UIScreen.main.bounds.height - 200, alignment: .top)
            }
        }
    }
}

struct GainerLoserView_Previews: PreviewProvider {
    static var previews: some View {
        GainerLoserView(selectedTab: .constant(.house), refreshing: .constant(true))
    }
}
