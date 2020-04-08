//
//  AppViewModel.swift
//  FreeApps
//
//  Created by Susim Samanta on 08/04/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import Foundation

class AppViewModel: Identifiable {
    private let app: App
    
    init(app: App) {
        self.app = app
    }
    
    var id: String {
        return app.id
    }
    
    var name: String {
        return app.name
    }
    
    var author: String {
        return app.author
    }
    
    var iconUrl: URL {
        return URL(string: app.iconUrl)!
    }
}
