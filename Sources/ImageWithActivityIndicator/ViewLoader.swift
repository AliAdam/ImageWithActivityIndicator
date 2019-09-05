//
//  ImageLoader.swift
//  testswiftui
//
//  Created by Ali Adam on 6/12/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public class ViewLoader: ObservableObject {

    @Published var data = Data()
    let url:String
    
    public init(url:String){
        self.url = url
    }
    
    public func loadData() {
        guard let url = URL(string:url) else {
            return
        }

        URLSession.shared.dataTask(with: url){(data,_,_) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
    
    public func getData() -> Data {
        return data
    }
    
    public func getUrl() -> String {
        return url
    }
}
