//
//  API-Default.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/27/23.
//

import SwiftUI

struct Stocks: Hashable, Codable {
    let symbol: String
    let name: String
    let changesPercentage: Double
}

class ViewModel: ObservableObject {
    @Published var retrievedData: [Stocks] = []
    var key: String = apikey().key
    
    func fetch(method: tabBar.Tab) {
        var urlModifier = ""
        if (method == tabBar.Tab.gainers) {
            urlModifier = "gainers"
        }
        if (method == tabBar.Tab.losers) {
            urlModifier = "losers"
        }
        
        let url = URL(string: "https://financialmodelingprep.com/api/v3/stock_market/"+urlModifier+"?apikey="+key)

        var request = URLRequest(url: url!)

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }

            let json = try! JSONDecoder().decode([Stocks].self, from: data)

            DispatchQueue.main.async {
                print("got data")
                self.retrievedData = json
            }
        }
        
        task.resume()
    }
}

struct API_Default: View {
    var body: some View {
        Text("api")
    }
}

struct API_Default_Previews: PreviewProvider {
    static var previews: some View {
        API_Default()
    }
}
