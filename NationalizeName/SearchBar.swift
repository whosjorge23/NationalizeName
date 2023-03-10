//
//  SearchBar.swift
//  NationalizeName
//
//  Created by Giorgio Giannotta on 14/01/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    @Binding var searchActive: Bool

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding()
                .frame(height: 11.0)
            Button(action: {
                self.text = ""
                self.searchActive = true
            }) {
                Image(systemName: "xmark.circle.fill").opacity(text == "" ? 0 : 1).foregroundColor(Color.purple)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: <#T##Binding<String>#>, placeholder: "Enter a name")
//    }
//}
