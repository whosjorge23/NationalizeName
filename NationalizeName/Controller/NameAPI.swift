//
//  NameAPI.swift
//  NationalizeName
//
//  Created by Giorgio Giannotta on 14/01/23.
//

import Foundation

class NameAPI {
    func fetchName(name: String, completion: @escaping (Name?) -> ()) {
        let baseURL = "https://api.nationalize.io/?name=\(name)"
        guard let url = URL(string: baseURL) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching name: \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let name = try JSONDecoder().decode(Name.self, from: data)
                completion(name)
            } catch {
                print("Error decoding name: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
