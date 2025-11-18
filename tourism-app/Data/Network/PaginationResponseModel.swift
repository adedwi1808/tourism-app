//
//  PaginationResponseModel.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//


struct PaginationResponseModel<T>: Codable where T: Codable{
    let error: Bool?
    let message: String?
    let count: Int?
    let places: [T]?
}
