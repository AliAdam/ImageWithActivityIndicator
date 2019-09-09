//
//  File.swift
//  
//
//  Created by luca on 9/5/19.
//

@available(iOS 13.0, *)
public struct ViewLoaders {
    var loaders: [ViewLoader] = []
    init(urls: [String]) {
        for url in urls {
            loaders.append(ViewLoader(url: url))
        }
    }
}
