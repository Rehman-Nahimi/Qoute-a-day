//
//  ContentView.swift
//  Qoute a day
//
//  Created by Ray Nahimi on 25/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                Spacer()
                    .frame(height: 75)
                
                Text("This is where the qoute will go")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.fontBrown)
                    .padding()
                    
                Text("Author")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.fontDarkBrown)
                
                Spacer()
                    .frame(height: 100)
                Button{
                    refresh()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.fontDarkBrown)
                }
                
                Spacer()
                    .frame(height: 25)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        
            .background(.lightBackground)
            
        }
        
    }
    func refresh() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
