//
//  TouristAttraction.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import Foundation

struct TouristAttractionModel {
    let id: Int
    let name: String
    let description: String
    let address: String
    let longitude: Double
    let latitude: Double
    let like: Int
    let image: String
    var imageURL: URL? {
        return URL(string: image)
    }
}
