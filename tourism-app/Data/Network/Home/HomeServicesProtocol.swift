//
//  HomeServicesProtocol.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import Foundation

protocol HomeServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getTouristAttraction(endPoint: NetworkFactory) async throws -> PaginationResponseModel<TouristAttractionResponseModel>
}
