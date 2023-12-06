//
//  Quote .swift
//  Qoute a day
//
//  Created by Ray Nahimi on 01/12/2023.
//

import Foundation
import SwiftUI

struct Quote: Identifiable, Codable {
    
    var id = UUID()
    var text: String
    var author: String
    
    var genre: [String]
}

struct NewQuote: Encodable, Decodable {
    var id: String
    var qoute: String
    var author: String
    var genre: [String]
}

extension Encodable{
    var toDictionary: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
