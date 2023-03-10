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
    @State private var searchActive: Bool = false
    let api = NameAPI()
    var body: some View {
        VStack {
            Text("Nationalize Name")
                .font(.largeTitle)
            SearchBar(text: $searchText, placeholder: "Enter a name", searchActive: $searchActive)
                .padding()
            Button(action: {
                if searchText != "" {
                    self.fetchName()
                    self.searchActive = false
                }
            }) {
                Text("Search")
                    .padding(15)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            Rectangle()
                .frame(width: 30, height: 20).foregroundColor(Color.clear)
            if name != nil && searchText != "" && !searchActive {
                Text("Result for the name: \(searchText)")
                    .font(.title)
                    .padding(5)
                ForEach(name!.country, id: \.country_id) { country in
                    VStack {
                        Text("Country: \(countriesDictionary[country.country_id]  ?? "") \(countriesFlags[country.country_id]  ?? "")")
                        Text("Probability: \(String(format: "%.2f", country.probability * 100))%")
                    }
                    .padding(5)
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
