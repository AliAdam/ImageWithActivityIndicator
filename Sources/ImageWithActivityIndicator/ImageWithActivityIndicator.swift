//
//  SwiftUIView.swift
//  testswiftui
//
//  Created by Ali Adam on 6/12/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import SwiftUI


@available(iOS 13.0, *)
public struct ViewWithActivityIndicator<Content:View> : View {

    private let style: UIActivityIndicatorView.Style = .medium

    @ObservedObject private var viewLoader:ViewLoader
    private var content: () -> Content
    private let placeHolder:String
    private let showActivityIndicator:Bool

    public init(placeHolder: String = "",showActivityIndicator:Bool = true, viewLoader:ViewLoader, @ViewBuilder _ content: @escaping () -> Content){
        self.placeHolder = placeHolder
        self.showActivityIndicator = showActivityIndicator
        self.viewLoader = viewLoader
        self.content = content
    }
    
    public var body: some View {
            ZStack(){
                if  (viewLoader.data.isEmpty) {
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
        self.viewLoader.loadData()
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
