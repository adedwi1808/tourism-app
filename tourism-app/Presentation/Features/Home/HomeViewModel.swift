//
//  HomeViewModel.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func onSuccess()
    func onFailed(message: String)
}

@MainActor
final class HomeViewModel {
    var touristAttractionPlaces: [TouristAttractionModel] = []
    
    var isLoading: Bool = false
    
    weak var delegate: HomeViewModelProtocol? = nil
    
    let services: HomeServicesProtocol
    
    init(services: HomeServicesProtocol) {
        self.services = services
    }
    
    func getTouristAttraction() async {
        isLoading = true
        
        do {
            let response = try await services.getTouristAttraction(endPoint: .getTouristAttraction)
            touristAttractionPlaces = response.places?.compactMap { $0.toModel() } ?? []
            isLoading = false
            delegate?.onSuccess()
        } catch let error {
            isLoading = false
            
            if error is NetworkError {
                delegate?.onFailed(message: error.localizedDescription)
            }
        }
    }
}
