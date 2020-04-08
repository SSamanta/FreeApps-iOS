//
//  AppsViewModel.swift
//  FreeApps
//
//  Created by Susim Samanta on 17/02/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import Foundation
import Combine

class AppsViewModel: ObservableObject {
    
    private let appStoreService = AppStoreService()
    private var subscriptions = Set<AnyCancellable>()
    @Published var freeApps = [AppViewModel]()
    @Published var error: AppError? = nil
    
    func fetchApps() {
        appStoreService
            .fetchFreeApps()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                  self.error = error
                }
            }, receiveValue: { (store) in
                self.freeApps = store.feed.entry.map({ (entry) -> AppViewModel in
                    let app = App(id: entry.id.label, name: entry.title.label, author: entry.imArtist.label,iconUrl: entry.imImage.first?.label ?? "")
                    return AppViewModel(app: app)
                })
            })
            .store(in: &subscriptions)
    }
}
