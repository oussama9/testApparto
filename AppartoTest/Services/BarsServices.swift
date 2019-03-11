//
//  BarsServices.swift
//  AppartoTest
//

import Foundation
import UIKit
import FontAwesome_swift

class BarsServices {
    
    static let instance = BarsServices()
    let bars : [Bar]
    
    init() {
        let path = Bundle.main.url(forResource: "data", withExtension: "json", subdirectory: "Utils")
        let data = try! Data(contentsOf : path!)
        let result = try! JSONDecoder().decode(JsonResponse.self, from: data)
        bars = result.bars
    }
    
    static func loadAndSetUpImageByUrl(image_url: String, barImage: UIImageView) {
        if let ThumbImageUrl = URL(string: image_url) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: ThumbImageUrl)
                let image: UIImage?
                if let data = data {
                    image = UIImage(data: data)
                } else {
                    image = UIImage.fontAwesomeIcon(
                        name: .image,
                        style: .solid,
                        textColor: .gray,
                        size: CGSize(width: 100, height: 100)
                    )
                }
                DispatchQueue.main.async {
                    barImage.image = image
                }
            }
        }
    }
}
