//
//  Bar.swift
//  AppartoTest
//

import Foundation

struct Bar : Codable {
    
    let id : Int?
    let name : String?
    let address : String?
    let url : String?
    let image_url : String?
    let longitude : Double?
    let latitude : Double?
    let tags : String?
    
    init(id : Int ,name : String, address : String, url : String, image_url : String, longitude :Double, latitude : Double, tags: String) {
        self.id = id
        self.name = name
        self.address = address
        self.url = url
        self.image_url = image_url
        self.latitude = latitude
        self.longitude = longitude
        self.tags = tags
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        address = try container.decode(String.self, forKey: .address)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
        image_url = try container.decode(String.self, forKey: .image_url)
        if let value = try? container.decode(Bool.self, forKey: .tags) {
            tags = "No tags"
        } else {
            tags = try container.decode(String.self, forKey: .tags)
        }
        longitude = try container.decode(Double.self, forKey: .longitude)
        latitude = try container.decode(Double.self, forKey: .latitude)
    }
}

extension Bar {
    enum CodingKeys: String, CodingKey {
        case id
        case address
        case name
        case url
        case image_url
        case tags
        case longitude
        case latitude
    }
}
