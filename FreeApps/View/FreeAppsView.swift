//
//  FreeAppsView.swift
//  FreeApps
//
//  Created by Susim Samanta on 17/02/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import SwiftUI

struct FreeAppsView: View {
    @ObservedObject var model: AppsViewModel
    
    init() {
        model = AppsViewModel()
        model.fetchApps()
    }
    
    var body: some View {
        return NavigationView {
            List {
                ForEach (self.model.freeApps) { app in
                    AppView(model: app)
                }
            }.navigationBarTitle("Top Free Apps")
                .navigationBarItems(trailing:refreshButton)
        }
        .alert(item: self.$model.error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.description ?? ""),
                dismissButton: .cancel()
            )
        }
    }
}

extension FreeAppsView {
    private var refreshButton: some View {
        Button("Refresh") {
            self.model.fetchApps()
        }
    }
}

struct FreeAppsView_Previews: PreviewProvider {
    static var previews: some View {
        FreeAppsView()
    }
}

struct AppPreviewSource {
    static let app = App(id: "0", name: "Snapchat", author: "Snapchat", iconUrl: "https://apple.com")
    static let model = AppViewModel(app: app)
    
}
