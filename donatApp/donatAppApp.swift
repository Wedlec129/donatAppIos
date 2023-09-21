//
//  donatAppApp.swift
//  donatApp
//
//  Created by Борух Соколов on 17.09.2023.
//

import SwiftUI

@main
struct donatAppApp: App {
    var body: some Scene {
        WindowGroup {
            homePageView()
                .environmentObject(DonatViewModel())
                
        }
    }
}
