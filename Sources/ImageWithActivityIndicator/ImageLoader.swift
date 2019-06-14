//
//  ImageLoader.swift
//  testswiftui
//
//  Created by Ali Adam on 6/12/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
class ImageLoader :BindableObject {
    
    var didChange = PassthroughSubject<Data,Never>()


    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    let imageURL:String

    
    init(imageURL:String){
        self.imageURL = imageURL
    }
    
      func loadImage() {
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
