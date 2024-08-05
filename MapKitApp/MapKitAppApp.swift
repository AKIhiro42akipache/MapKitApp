//
//  MapKitAppApp.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/04.
//

import SwiftUI

@main
struct MapKitAppApp: App {
    
    @StateObject private var viewModel = LocationViewModel()
    var body: some Scene {
        WindowGroup {
         LocationView()
                .environmentObject(viewModel)
        }
    }
}
