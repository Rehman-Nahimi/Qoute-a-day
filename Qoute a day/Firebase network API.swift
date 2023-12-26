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
    private var quotes: [Quote]?
    
    
    @Published var object: Quote? = nil
    
    
    func readObject() async {
        do {
            let snapshot = try await ref.root.getData()
            quotes = try snapshot.data(as: [Quote].self)
            object = quotes?.randomElement()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func refresh() async {
        if quotes != nil {
            object = quotes?.randomElement()
        } else {
            await readObject()
        }
    }
    
}


