//
//  Post.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/22/24.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
