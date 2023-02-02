//
//  Details.swift
//  Little Lemon App
//
//  Created by Vitaliy Iakushev on 30.01.2023.
//

import SwiftUI

struct Details: View {
    var title: String
    var price: String
    var image: String
    var description: String
    
    var body: some View {
        
            ScrollView{
                VStack{
                    HStack {
                        Text(title)
                            .font(Font.system(size: 16, weight: .bold))
                            .padding()
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        Text("$\(price)")
                            .font(Font.system(size: 16, weight: .bold))
                            .padding()
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    }
                    
                    Text(description)
                    AsyncImage(url: URL(string: image))
                        .frame(maxWidth: 300, maxHeight: 300)
                    
                    AsyncImage(url: URL(string: image)) { phase in
                        switch phase {
                        case .empty : Image(systemName: "exclamationmark.icloud")
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                
                        case .success(let image):
                            image.resizable()
                                .scaledToFit()
                            
                        case .failure(_):
                            Image(systemName: "exclamationmark.icloud")
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        @unknown default:
                            Image(systemName: "exclamationmark.icloud")
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        }
                        
                    }
                    .frame(width: 200, height: 200)
                }
            }

        
        
        

    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(title: "title", price: "price", image: "image", description: "description")
        
    }
}
