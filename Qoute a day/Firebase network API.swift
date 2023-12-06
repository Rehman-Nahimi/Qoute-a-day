//
//  Firebase network API.swift
//  Qoute a day
//
//  Created by Ray Nahimi on 30/11/2023.
//

import FirebaseCore
import FirebaseDatabase
import FirebaseDatabaseSwift
import Foundation
import UIKit


class NewAPI:ObservableObject{
    var ref = Database.database().reference()
    
    @Published var value: String? = nil
    
    @Published var object: NewQuote? = nil
    
    @Published var random = ["1","2","3","4"]
    
    func readObject() {
        ref.child(random.randomElement()!)
            .observe(.value) {snapshot in
                do{
                    self.object = try snapshot.data(as: NewQuote.self)
                }catch {
                    print("Can not convert NewQuote")
                }
            }
    }
}

class ApiCall{
    
    func fetchQuotes(completion:@escaping([Quote]) -> ()){
        guard let url = URL(string: "https://quote-a-day-efb42-default-rtdb.europe-west1.firebasedatabase.app/") else {return}
        URLSession.shared.dataTask(with: url) {(data, _, _) in
            let quotes = try! JSONDecoder().decode([Quote].self, from: data!)
            
            DispatchQueue.main.async {
                completion(quotes)
            }
        }
        .resume()
    }
}

class ApiService {
    func getQuotes() async throws -> [Quote]{
        let endpoint = "https://quote-a-day-efb42-default-rtdb.europe-west1.firebasedatabase.app/"
        
        guard let url  = URL(string: endpoint) else { throw TSError.invalidURL}
        
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw TSError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Quote].self, from:data)
        } catch {
            throw TSError.invalidData
        }
        
    }
    
    enum TSError: Error {
        
        case invalidURL
        case invalidResponse
        case invalidData
    }
}
