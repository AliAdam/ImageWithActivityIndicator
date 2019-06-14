//
//  SwiftUIView.swift
//  testswiftui
//
//  Created by Ali Adam on 6/12/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import SwiftUI


@available(iOS 13.0, *)
struct ImageWithActivityIndicator : View {

    private let style: UIActivityIndicatorView.Style = .medium
    private let placeHolder:String
    private let imageURL:String
    @ObjectBinding private var imageLoader:ImageLoader

    
    init(imageURL:String,placeHolder: String = ""){
        imageLoader = ImageLoader(imageURL: imageURL)
        self.imageURL = imageURL
        self.placeHolder = placeHolder
    }
    var body: some View {
            ZStack(){
                if  (imageLoader.data.isEmpty ) {
                    if (placeHolder != "") {
                        Image(placeHolder)
                            .resizable()
                            .scaledToFit()
                    }
                    ActivityIndicator(style: .large)
                }
                else{
                    
                    Image(uiImage: UIImage(data:self.imageLoader.data) ?? UIImage(named:placeHolder) ?? UIImage())
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
        ImageWithActivityIndicator(imageURL: "", placeHolder: "")
    }
}
#endif
