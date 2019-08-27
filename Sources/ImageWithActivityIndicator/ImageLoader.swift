//
//  ImageLoader.swift
//  testswiftui
//
//  Created by Ali Adam on 6/12/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public class ImageLoader: ObservableObject {

    @Published var data = Data()
    let imageURL:String

    
    public init(imageURL:String){
        self.imageURL = imageURL
    }
    
      public func loadImage() {
        guard let url = URL(string:imageURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url){(data,_,_) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
            
            }.resume()
    }
}
