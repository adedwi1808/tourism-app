//
//  HomeServices.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

final class HomeServices: HomeServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol) {
        self.networker = networker
    }
    
    func getTouristAttraction(endPoint: NetworkFactory) async throws -> PaginationResponseModel<TouristAttractionResponseModel> {
        return try await networker.taskAsync(type: PaginationResponseModel<TouristAttractionResponseModel>.self, endPoint: endPoint, isMultipart: false)
    }
}
