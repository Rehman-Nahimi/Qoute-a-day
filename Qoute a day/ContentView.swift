//
//  ContentView.swift
//  Qoute a day
//
//  Created by Ray Nahimi on 25/11/2023.
//
import OpenAIKit
import SwiftUI


final class ViewModel: ObservableObject {
    private var openai: OpenAI?
    
    func setup() {
        openai = OpenAI(Configuration(organizationId: "personal", apiKey: "Enter OpenAI key here"))
        
    }
    
    func generateImage(prompt: String) async -> UIImage? {
        guard let openai = openai else {
            return nil
        }
        do {
            let params = ImageParameters(
                prompt: prompt,
                resolution: .large,
                responseFormat: .base64Json
            )
            let result = try await openai.createImage(parameters: params)
            let data = result.data[0].image
            let image = try openai.decodeBase64Image(data)
            return image
            
        }
        catch{
            print(String(describing: error))
            return nil
        }
    }
    
}




struct ContentView: View {
    
    @StateObject var viewModel = NewAPI()
    @ObservedObject var newViewModel = ViewModel()
    @State var text = ""
    @State var image: UIImage?
    
    
    var body: some View {
        NavigationView{
            VStack {
                Image(uiImage: image ?? UIImage(systemName: "timelapse")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .cornerRadius(25)
                        .redacted(reason: image == nil ? .placeholder:[])
                
                Spacer()
                
                Text(viewModel.object?.qoute ?? "The quote is loading")
                        .font(.system(size: 30, weight: .bold))
                        .minimumScaleFactor(0.01)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.fontBrown)
                        .frame(width: 350, height: 250)
                        .redacted(reason: viewModel.object?.qoute == nil ? .placeholder:[])
                Text(viewModel.object?.author ?? "Author")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.fontDarkBrown)
                    .redacted(reason: viewModel.object?.author == nil ? .placeholder:[])
                
                Spacer()
                    .frame(height: 1)
                
                Button{
                  Task {
                      image = nil
                    await viewModel.refresh()
                      guard let quote = viewModel.object?.prompt
                      else{
                          return
                      }
                      
                          
                      let result = await newViewModel.generateImage(prompt: "Anime style \(quote)")
                      self.image = result
                      
                  }
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.fontDarkBrown)
                }
                Spacer()
                    .frame(height: 75)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        
            .background(.lightBackground)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    VStack{
                        Spacer()
                            .padding(18)
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
                    }
                }
            }
            
            
        }
        .onAppear {
          Task {
            await viewModel.readObject()
              
            newViewModel.setup()
              guard let quote = viewModel.object?.prompt
              else{
                  return
              }
                  
              let result = await newViewModel.generateImage(prompt: "anime style \(quote)")
              
              self.image = result
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
