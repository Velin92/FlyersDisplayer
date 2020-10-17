//
//  FlyersListResponse.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//

import Foundation

// MARK: - FlyersListResponse
struct FlyersListResponse: Codable {
    let metadata: Metadata?
    let data: [FlyerData]?
}

// MARK: - Datum
struct FlyerData: Codable {
    let id, retailerID, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case retailerID = "retailer_id"
        case title
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    let success, code: Int?
    let message: String?
    let time: Double?
}
