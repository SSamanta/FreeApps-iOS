//
//  API.swift
//  FreeApps
//
//  Created by Susim Samanta on 17/02/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import Foundation
import Combine

enum AppError: LocalizedError, Identifiable {
    
    var id: String { localizedDescription }
    
    case invalidResponse
    case addressUnreachable(URL)
    var description: String? {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case .addressUnreachable(let url):
            return "\(url.absoluteString) is unreachable"
        }
    }
}

enum Endpoint {
    static let baseURL = URL(string: "http://itunes.apple.com")!
    
    case freeApps
    
    var url: URL {
        switch self {
        case .freeApps:
            return Endpoint.baseURL.appendingPathComponent("/us/rss/topfreeapplications/limit=200/json")
        }
    }
}
