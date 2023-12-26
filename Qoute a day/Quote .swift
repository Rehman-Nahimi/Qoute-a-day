//
//  Quote .swift
//  Qoute a day
//
//  Created by Ray Nahimi on 01/12/2023.
//

import Foundation
import SwiftUI

struct Quote: Identifiable, Codable {
    
    var id: String
    var qoute: String
    var author: String
    var genre: [String]
}


