//
//  ContentView.swift
//  NationalizeName
//
//  Created by Giorgio Giannotta on 14/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var name: Name? = nil
    let api = NameAPI()
    var body: some View {
        VStack {
            
            SearchBar(text: $searchText, placeholder: "Enter a name")
            Button(action: {
                if searchText != "" {
                    self.fetchName()
                }
            }) {
                Text("Search")
            }
            Rectangle()
                .frame(width: 30, height: 20).foregroundColor(Color.clear)
            if name != nil {
                Text("Result")
                ForEach(name!.country, id: \.country_id) { country in
                    HStack {
                        Text("Country: \(country.country_id)")
                        Text("Probability: \(String(format: "%.2f", country.probability * 100))%")
                    }
                }
            }

            Spacer()
        }
        .padding()
    }
    func fetchName() {
        api.fetchName(name: searchText) { (name) in
            if let name = name {
                self.name = name
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
