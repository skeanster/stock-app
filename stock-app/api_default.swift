//
//  API-Default.swift
//  stock-app
//
//  Created by Ryan Skeans on 6/27/23.
//

import SwiftUI

struct Data: Hashable, Codable {
    let symbol: String
}

class ViewModel: ObservableObject {
    @Published var retrievedData: [Data] = []
    var key: String = apikey().key
    
    func fetch(method: tabBar.Tab) {
        var urlModifier = ""
        if (method == tabBar.Tab.gainers) {
            urlModifier = "gainers"
        }
        if (method == tabBar.Tab.losers) {
            urlModifier = "losers"
        }
        
        print(urlModifier)
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

            let json = try! JSONDecoder().decode([Data].self, from: data)


            DispatchQueue.main.async {
                self.retrievedData = json
            }
            print(json)
        }

        task.resume()
    }
}

struct API_Default: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct API_Default_Previews: PreviewProvider {
    static var previews: some View {
        API_Default()
    }
}
