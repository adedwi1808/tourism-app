//
//  TouristAttractionResponseModel.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

// MARK: - TouristAttractionResponseModel
struct TouristAttractionResponseModel: Codable {
    let id: Int?
    let name, description, address: String?
    let longitude, latitude: Double?
    let like: Int?
    let image: String?
}

extension TouristAttractionResponseModel {
    func toModel() -> TouristAttractionModel {
        TouristAttractionModel(
            id: id ?? 0,
            name: name ?? "",
            description: description ?? "",
            address: address ?? "",
            longitude: longitude ?? 0.0,
            latitude: latitude ?? 0.0,
            like: like ?? 0,
            image: image ?? ""
        )
    }
}
