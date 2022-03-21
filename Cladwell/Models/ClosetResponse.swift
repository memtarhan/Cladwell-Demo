//
//  ClosetResponse.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 21/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation

// MARK: - ClosetResponse

struct ClosetResponse: Codable {
    let items: [ItemResponse]
    let capsules: [CapsuleResponse]
    let storage: [Int]
}

// MARK: - Capsule

struct CapsuleResponse: Codable {
    let id, name: String?
    let stats: CapsuleStatsResponse?
    let items: [Int]
}

// MARK: - CapsuleStats

struct CapsuleStatsResponse: Codable {
    let percentWorn, outfits: Int
}

// MARK: - Item

struct ItemResponse: Codable {
    let id: Int?
    let name: String?
    let image: String?
//    let style: Style
//    let stats: ItemStatsResponse
}

// MARK: - ItemStats

struct ItemStatsResponse: Codable {
    let lastWorn, timesWorn: Int
    let outfitCounts: OutfitCountsResponse
}

// MARK: - OutfitCounts

struct OutfitCountsResponse: Codable {
    let closet, work235: Int

    enum CodingKeys: String, CodingKey {
        case closet
        case work235 = "work-235"
    }
}
