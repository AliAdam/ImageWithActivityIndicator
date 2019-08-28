//
//  SwiftUIView.swift
//  testswiftui
//
//  Created by Ali Adam on 6/12/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import SwiftUI


@available(iOS 13.0, *)
public struct ImageWithActivityIndicator<Content:View> : View {

    private let style: UIActivityIndicatorView.Style = .medium
    private let placeHolder:String
    private let imageURL:String
    private let showActivityIndicator:Bool

    @ObservedObject private var imageLoader:ImageLoader
    
    var content: () -> Content

    
    public init(imageURL:String, placeHolder: String = "",showActivityIndicator:Bool = true, imageLoader:ImageLoader, @ViewBuilder _ content: @escaping () -> Content){
        self.imageURL = imageURL
        self.placeHolder = placeHolder
        self.showActivityIndicator = showActivityIndicator
        self.imageLoader = imageLoader
        self.content = content
    }
    public var body: some View {
            ZStack(){
                if  (imageLoader.data.isEmpty ) {
                    if (placeHolder != "") {
                        Image(placeHolder)
                            .resizable()
                            .scaledToFit()
                    }
                    
                    if showActivityIndicator {
                        ActivityIndicator(style: .large)
                    }
                }
                else{
                    content()
                }
                
                
                }
                .onAppear(perform: loadImage)
        

    }
    
    private  func loadImage() {
        self.imageLoader.loadImage()

    }

}

#if DEBUG

struct ImageWithActivityIndicator_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        Text("not used")
    }
}
#endif
