//
//  AppStoreService.swift
//  FreeApps
//
//  Created by Susim Samanta on 20/02/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import Foundation
import Combine

struct AppStoreService {
    private let network = Network()
    private let decoder = JSONDecoder()

    func fetchFreeApps() -> AnyPublisher<AppStore, AppError> {
        network.getData()
            .decode(type: AppStore.self, decoder: decoder)
            .mapError({ error -> AppError in
                return AppError.invalidResponse
            })
            .eraseToAnyPublisher()
    }
}
