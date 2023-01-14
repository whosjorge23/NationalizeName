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
            SearchBar(text: $searchText, placeholder: "Search")
            Button(action: {
                if searchText != "" {
                    self.fetchName()
                }
            }) {
                Text("Search")
            }
            if name != nil {
                Text("Country: \(name!.country[0].country_id)")
                Text("Probability: \(name!.country[0].probability * 100)%")
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
