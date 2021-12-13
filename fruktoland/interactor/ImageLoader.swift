//
//  ImageLoader.swift
//  fruktoland
//
//  Created by Farkhod Khaknazarov on 05.12.2021.
//

import Foundation
import UIKit
import Combine
import Alamofire

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }
    
    func load() {
        AF.download(url).responseData { response in
            if let data = response.value {
                self.image = UIImage(data: data)
            }
        }
    }

    func cancel() {
        cancellable?.cancel()
    }
}
