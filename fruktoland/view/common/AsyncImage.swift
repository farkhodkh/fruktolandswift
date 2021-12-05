//
//  AsyncImage.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation
import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    private var imageHolder: String = "catalog"
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    
    init(imageHolder: String, url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        self.imageHolder = imageHolder
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        if imageHolder == "catalog" {
            content_catalog
                .onAppear(perform: loader.load)
        } else {
            content_goods
                .onAppear(perform: loader.load)
        }
    }
    
    private var content_catalog: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                .resizable()
                .frame(
                    width: 50,
                    height: 40,
                    alignment: .center
                )
            } else {
                placeholder
            }
        }
    }
    
    private var content_goods: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                .resizable()
                .frame(
                    width: 80,
                    height: 60,
                    alignment: .center
                )
            } else {
                placeholder
            }
        }
    }
}
