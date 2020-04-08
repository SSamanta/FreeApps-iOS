//
//  AppView.swift
//  FreeApps
//
//  Created by Susim Samanta on 26/02/20.
//  Copyright © 2020 Susim. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct AppView: View {
    let model: AppViewModel
    
    var body: some View {
        HStack {
            KFImage(model.iconUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:50, height:50)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text(model.name)
                    .bold()
                Text(model.author)
                    .italic()
            }
            
        }
    }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(model: AppPreviewSource.model)
    }
}
