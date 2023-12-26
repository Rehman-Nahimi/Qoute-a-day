//
//  ContentView.swift
//  Qoute a day
//
//  Created by Ray Nahimi on 25/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = NewAPI()
    
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
                    
                Text(viewModel.object?.qoute ?? "This is where the qoute will go")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.fontBrown)
                        .padding()
                Text(viewModel.object?.author ?? "Author")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.fontDarkBrown)
                
                
                
                Spacer()
                    .frame(height: 100)
                Button{
                  Task {
                    await viewModel.refresh()
                  }
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
        .onAppear {
          Task {
            await viewModel.readObject()
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
