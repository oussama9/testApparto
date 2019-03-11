//
//  JsonResponse.swift
//  AppartoTest
//

import Foundation

struct  JsonResponse : Codable {
    
    let code : Int
    let bars : [Bar]
    let neighborhoods : [Neighborhood]
    let city : City
}
