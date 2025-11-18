//
//  TouristAttractionResponseModel.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

// MARK: - Place
struct TouristAttractionResponseModel: Codable {
    let id: Int?
    let name, description, address: String?
    let longitude, latitude: Double?
    let like: Int?
    let image: String?
}
