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
                ZStack{
                    RoundedRectangle(cornerRadius: 100)
                        .fill(
                            LinearGradient(
                                colors: [
                                    .lightBackground,
                                    .fontBrown
                                ],
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading
                            )
                        )
                    SwiftLogo()
                        .fill(.white)
                        .padding(17)
                        
                }
                .frame(width: 100, height: 100)
                
                Spacer()
                    .frame(height: 175)
                
                Text("This is where the qoute will go")
                    .multilineTextAlignment(.center)
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
                    .frame(height: 175)
                
                
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
