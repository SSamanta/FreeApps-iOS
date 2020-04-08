//
//  Network.swift
//  FreeApps
//
//  Created by Susim Samanta on 20/02/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import Foundation
import Combine

struct Network {
    private let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)
    
    func getData() -> AnyPublisher<Data, AppError> {
        URLSession.shared.dataTaskPublisher(for: Endpoint.freeApps.url)
            .receive(on: apiQueue)
            .map(\.data)
            .mapError { error -> AppError in
              return AppError.addressUnreachable(Endpoint.freeApps.url)
            }
            .eraseToAnyPublisher()
    }
}
