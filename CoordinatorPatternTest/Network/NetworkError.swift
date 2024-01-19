//
//  NetworkError.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/19/24.
//

import Foundation


enum NetworkError: String, Error {
    case badURL
    case badServerResponse
    case badParsing
}
